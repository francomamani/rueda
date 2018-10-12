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
    title: 'Auth',
    icon: 'nb-locked',
    children: [
      {
        title: 'Login',
        link: '/auth/login',
      },
      {
        title: 'Register',
        link: '/auth/register',
      },
      {
        title: 'Request Password',
        link: '/auth/request-password',
      },
      {
        title: 'Reset Password',
        link: '/auth/reset-password',
      },
    ],
  },
];
