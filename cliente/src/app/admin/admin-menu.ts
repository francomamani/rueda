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
                title: 'Crear Cita de Administración',
                icon: 'nb-plus',
                link: '/admin/agenda/crear-admin',
            },
            {
                title: 'Crear Cita de Contingencia',
                icon: 'nb-plus',
                link: '/admin/agenda/crear-contingencia',
            },
        ],
    },
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
        }],
    },
];
