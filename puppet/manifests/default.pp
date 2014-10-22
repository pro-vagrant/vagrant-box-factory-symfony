stage { 'update':
  before => Stage['postupdate']
}

stage { 'postupdate':
  before => Stage['main']
}

class {
  'ubuntu':   stage => update, action => 'clean';
  'mysql':    stage => main;
  'php5':     stage => main;
  'composer': stage => main;
}
