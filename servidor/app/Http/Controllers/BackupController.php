<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Artisan;

class BackupController extends Controller
{
    public function generarBackup() {
        try {
            $filename = 'backup-rueda-' . date('Y-m-d');
            Artisan::call('backup:mysql-dump', ['filename' => $filename]);
            $output = Artisan::output();
            return response()
                        ->download(storage_path('app/backups/' . $filename . '.sql'));
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
