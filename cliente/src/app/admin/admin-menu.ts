import { NbMenuItem } from '@nebular/theme';

export const ADMIN_ITEMS: NbMenuItem[] = [
    {
        title: 'Rubro',
        icon: 'nb-gear',
        link: '/admin/rubro',
    },
    {
      title: 'Empresas',
      icon: 'nb-home',
      link: '/admin/empresa',
      children: [
        {
          title: 'Busqueda',
          icon: 'nb-search',
          link: '/admin/empresa/listar',
        },
        {
          title: 'Nuevo Registro',
          icon: 'nb-plus',
          link: '/admin/empresa/crear',
        },
      ],
    },
    {
        title: 'Horarios',
        icon: 'nb-email',
        link: '/admin/horario',
        children: [
            {
                title: 'Horarios habilitados',
                icon: 'nb-search',
                link: '/admin/horario/listar',
            },
            {
                title: 'Nuevo Horario',
                icon: 'nb-plus',
                link: '/admin/horario/crear',
            },
        ],
    },
    {
        title: 'Mesas',
        icon: 'nb-keypad' +
          '',
        link: '/admin/mesa',
    },
    {
        title: 'Reuniones',
        icon: 'nb-heart',
        link: '/admin/reuniones',
        children: [
            {
                title: 'Lista de Reuniones',
                icon: 'nb-search',
                link: '/admin/reuniones/listar',
            },
            {
                title: 'Nueva Reunion',
                icon: 'nb-plus',
                link: '/admin/reuniones/crear',
            },
        ],
    },
];
