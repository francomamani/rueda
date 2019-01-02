import { NbMenuItem } from '@nebular/theme';
let empresa_id = 0;
empresa_id = JSON.parse(atob(localStorage.getItem('rueda-usuario'))).empresa_id;

export const EMPRESA_ITEMS: NbMenuItem[] = [
  {
    title: 'Principal',
    icon: 'nb-home',
    link: '/empresa/home',
  },
  {
    title: 'Crear Reuniones',
    icon: 'nb-home',
    link: '/empresa/mi-agenda/empresas-registradas',
  },
/*  {
    title: 'Crear Reuniones',
    icon: 'nb-plus',
    link: '/empresa/mi-agenda/crear',
  },*/
  {
    title: 'Ver Agenda',
    icon: 'nb-star',
    link: '/empresa/mi-agenda/reuniones-agendadas',
  },
  {
    title: 'Horarios Ocupados',
    icon: 'nb-keypad',
<<<<<<< HEAD
    link: '/empresa/horarios-ocupados/listar/empresa/' + empresa_id,
=======
    link: '/empresa/horarios-ocupados/listar/empresa/'
      + JSON.parse(atob(localStorage.getItem('rueda-usuario'))).empresa_id,
>>>>>>> 5c808488cdf37ae602d6345357ad070d6f0a8f16
  },
  {
    title: 'Mis Participantes',
    icon: 'nb-person',
<<<<<<< HEAD
    link: '/empresa/mis-participantes/' + empresa_id,
=======
    link: '/empresa/mis-participantes/' + JSON.parse(atob(localStorage.getItem('rueda-usuario'))).empresa_id,
>>>>>>> 5c808488cdf37ae602d6345357ad070d6f0a8f16
  },
/*  {
    title: 'Solicitudes Salientes',
    icon: 'nb-paper-plane',
    link: '/empresa/mi-agenda/solicitudes-salientes',
  },
  {
    title: 'Solicitudes Entrantes',
    icon: 'nb-notifications',
    link: '/empresa/mi-agenda/solicitudes-entrantes',
  },*/
  {
    title: 'Evaluación',
    icon: 'nb-tables',
    link: '/empresa/evaluacion-general',
  }];
