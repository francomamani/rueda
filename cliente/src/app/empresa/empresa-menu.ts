import { NbMenuItem } from '@nebular/theme';

export const EMPRESA_ITEMS: NbMenuItem[] = [
  {
    title: 'Principal',
    icon: 'nb-home',
    link: '/empresa/home',
  }, {
    title: 'Horarios Ocupados',
    icon: 'nb-keypad',
    link: '/empresa/horarios-ocupados',
  }, {
    title: 'Mis Participantes',
    icon: 'nb-person',
    link: '/empresa/mis-participantes/' + JSON.parse(atob(localStorage.getItem('rueda-usuario'))).empresa.empresa_id,
  },
  /*{
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
  },*/
];
