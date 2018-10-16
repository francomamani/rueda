import { NbMenuItem } from '@nebular/theme';

export const EMPRESA_ITEMS: NbMenuItem[] = [
  {
    title: 'Principal',
    icon: 'nb-home',
    link: '/empresa/home',
  }, {
    title: 'Horarios Ocupados',
    icon: 'nb-keypad',
    link: '/empresa/horarios-ocupados/listar/empresa/' + JSON.parse(atob(localStorage.getItem('rueda-usuario'))).empresa.empresa_id,
  }, {
    title: 'Mis Participantes',
    icon: 'nb-person',
    link: '/empresa/mis-participantes/' + JSON.parse(atob(localStorage.getItem('rueda-usuario'))).empresa.empresa_id,
  }, {
    title: 'Mi Agenda',
    icon: 'nb-tables',
    children: [
      {
        title: 'Solicitudes Salientes',
        icon: 'nb-paper-plane',
        link: '/empresa/mi-agenda/solicitudes-salientes',
      },
      {
        title: 'Solicitudes Entrantes',
        icon: 'nb-notifications',
        link: '/empresa/mi-agenda/solicitudes-entrantes',
      },
      {
        title: 'Reuniones Agendadas',
        icon: 'nb-star',
        link: '/empresa/mi-agenda/reuniones-agendadas',
      },
    ],
  },
  {
    title: 'Evaluación',
    icon: 'nb-tables',
    link: '/empresa/evaluacion-general',
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
