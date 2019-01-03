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
        title: 'Usuarios',
        icon: 'nb-person',
        link: '/admin/usuario',
        children: [
            {
                title: 'Busqueda',
                icon: 'nb-search',
                link: '/admin/usuario/listar',
            },
            {
                title: 'Nuevo admin',
                icon: 'nb-plus',
                link: '/admin/usuario/crear',
            },
        ],
    },
    {
        title: 'Horarios',
        icon: 'nb-email',
        link: '/admin/horario/listar',
    },
    {
        title: 'Mesas',
        icon: 'nb-keypad' +
          '',
        link: '/admin/mesa',
    },
/*    {
        title: 'Agenda',
        icon: 'nb-compose',
        link: '/admin/agenda',
        children: [
            {
                title: 'Lista de Agenda',
                icon: 'nb-search',
                link: '/admin/agenda/listar',
            },
            {
                title: 'Crear Reunión de Administración',
                icon: 'nb-plus',
                link: '/admin/agenda/crear-admin',
            },
            {
                title: 'Crear Reunión de Contingencia',
                icon: 'nb-plus',
                link: '/admin/agenda/crear-contingencia',
            },
        ],
    },*/
    {
        title: 'Reporte',
        icon: 'nb-bar-chart',
        children: [
        {
          title: 'Reuniones',
          icon: 'nb-bar-chart',
          link: '/admin/reportes/reuniones',
        }, {
          title: 'Evaluaciones Generales',
          icon: 'nb-bar-chart',
          link: '/admin/reportes/evaluaciones-generales',
        }, {
            title: 'Evaluaciones de Reuniones',
            icon: 'nb-bar-chart',
            link: '/admin/reportes/evaluaciones-reuniones',
        }, {
            title: 'Comentarios Generales',
            icon: 'nb-bar-chart',
            link: '/admin/reportes/comentarios-generales',
        }, {
            title: 'Comentarios por Reunión',
            icon: 'nb-bar-chart',
            link: '/admin/reportes/comentarios-reuniones',
        }],
    },
];
