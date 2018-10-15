import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'ngx-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent implements OnInit {

  rubros = [
    {
      numero: 1,
      descripcion: 'AGRÍCOLA, PECUARIO Y HORTOFRUTICOLA',
    },
    {
      numero: 2,
      descripcion: 'ALIMENTOS Y BEBIDAS',
    },
    {
      numero: 3,
      descripcion: 'PRODUCTOS PARA LA CONTRUCCIÓN Y DECORACIÓN',
    },
    {
      numero: 4,
      descripcion: 'PLÁSTICOS O AFINES',
    },
    {
      numero: 5,
      descripcion: 'ENVASES, EMBALAJES Y AFINES',
    },
    {
      numero: 6,
      descripcion: 'QUÍMICOS',
    },
    {
      numero: 7,
      descripcion: 'FARMACIA, MEDICAMENTOS',
    },
    {
      numero: 8,
      descripcion: 'EQUIPOS ELÉCTRICOS',
    },
    {
      numero: 9,
      descripcion: 'MINERÍA',
    },
    {
      numero: 10,
      descripcion: 'INDUSTRIA DE LA MADERA Y MUEBLES EN GENERAL',
    },
    {
      numero: 11,
      descripcion: 'INDUSTRIA TEXTIL, CONFECCIONES Y MODA',
    },
    {
      numero: 12,
      descripcion: 'CUERO CALZADO Y MANUFACTURAS DE CUERO',
    },
    {
      numero: 13,
      descripcion: 'INDUSTRIA PAPELERA Y GRÁFICA',
    },
    {
      numero: 14,
      descripcion: 'VEHÍCULOS AUTOMOTORES, PIEZAS, PARTES',
    },
    {
      numero: 15,
      descripcion: 'EQUIPOS E IMPLEMENTOS HIDRAHULICOS',
    },
    {
      numero: 16,
      descripcion: 'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN',
    },
    {
      numero: 17,
      descripcion: 'ELECTRODOMÉSTICOS Y LÍNEA BLANCA',
    },
    {
      numero: 18,
      descripcion: 'ARTESANIAS',
    },
    {
      numero: 19,
      descripcion: 'JOYERÍA. BISUTERÍA Y ORFEBRERÍA',
    },
    {
      numero: 20,
      descripcion: 'COSMÉTICOS, BELLEZA Y SALUD',
    },
    {
      numero: 21,
      descripcion: 'METALMECÁNICA Y ELECTROMECÁNICA',
    },
    {
      numero: 22,
      descripcion: 'EQUIPOS DE TECNÓLOGÍA PARA LA INDUSTRIA MINERA, GAS, PETROLIO O SIMILARES',
    },
    {
      numero: 23,
      descripcion: 'PETROLEO, GAS Y PETROQUÍMICA',
    },
    {
      numero: 24,
      descripcion: 'ARTÍCULOS, IMPLEMENTOS Y EQUIPOS DE SEGURIDAD',
    },
    {
      numero: 25,
      descripcion: 'ARTÍCULOS DE LIMPIEZA PARA EL HOGAR',
    },
    {
      numero: 26,
      descripcion: 'JUGUETERÍA Y ARTÍCULOS DE ENTRETENIMIENTO',
    },
    {
      numero: 27,
      descripcion: 'FERRETERÍA Y HERRAMIENTAS',
    },
    {
      numero: 28,
      descripcion: 'ENERGÍA',
    },
    {
      numero: 29,
      descripcion: 'ECOLÓGÍA Y PROTECCIÓN DE MEDIO AMBIENTE',
    },
    {
      numero: 30,
      descripcion: 'TECNOLOGÍA Y EQUIPAMIENTO PARA AGROPECUARIA E INDUSTRIA',
    },
    {
      numero: 31,
      descripcion: 'OTROS',
    },
    {
      numero: 32,
      descripcion: 'COMPAÑÍA DE TRADING',
    },
    {
      numero: 33,
      descripcion: 'BANCOS Y FINANCIERAS',
    },
    {
      numero: 34,
      descripcion: 'FLETES Y TRANSPORTE',
    },
    {
      numero: 35,
      descripcion: 'SERVICIOS ADUANEROS',
    },
    {
      numero: 36,
      descripcion: 'ALMACENAMIENTO Y DISTRIBUCIÓN',
    },
    {
      numero: 37,
      descripcion: 'SEGUROS',
    },
    {
      numero: 38,
      descripcion: 'TURISMO',
    },
    {
      numero: 39,
      descripcion: 'SERVICIOS EMPRESARIALES',
    },
    {
      numero: 40,
      descripcion: 'SERVICIOS DE COSTRUCCIÓN E INGENIERÍA',
    },
    {
      numero: 41,
      descripcion: 'SERVICIOS INFORMÁTICOS Y DE TELECOMUNICACIÓN',
    },
    {
      numero: 42,
      descripcion: 'SERVICIOS PARA LA AGROINDUSTRIA',
    },
    {
      numero: 43,
      descripcion: 'OTROS SERVICIOS',
    },
    {
      numero: 44,
      descripcion: 'GOBIERNO Y SUS ORGANISMOS',
    },
    {
      numero: 45,
      descripcion: 'ORGANISMOS INTERNACIONALES',
    },
    {
      numero: 46,
      descripcion: 'CÁMARAS Y ORGANIZACIONES EMPRESARIALES',
    },
  ];
  search = '';
  constructor() { }

  ngOnInit() {
  }

}
