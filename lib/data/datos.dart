// Datos de la app usando Listas y Mapas.

const String tmdb = 'https://image.tmdb.org/t/p/w500';

// Perfiles: imágenes LOCALES (assets/images)
final List<Map<String, String>> perfiles = [
  {'nombre': 'Favio', 'avatar': 'assets/images/avatar1.png'},
  {'nombre': 'Ana', 'avatar': 'assets/images/avatar2.png'},
  {'nombre': 'Luis', 'avatar': 'assets/images/avatar3.png'},
  {'nombre': 'María', 'avatar': 'assets/images/avatar4.png'},
  {'nombre': 'Niños', 'avatar': 'assets/images/avatar5.png'},
];

// Títulos: imágenes en la NUBE (TMDB)
final Map<String, Map<String, dynamic>> titulos = {
  'stranger': {
    'titulo': 'Stranger Things',
    'imagen': '$tmdb/49WJfeN0moxb9IPfGn8AIqMGskD.jpg',
    'portada': '$tmdb/56v2KjBlU4XaOv9rVYEQypROD7P.jpg',
    'anio': 2016,
    'edad': '16+',
    'temporadas': 4,
    'genero': 'Ciencia ficción',
    'coincidencia': 98,
    'descripcion':
        'Cuando un niño desaparece, sus amigos, su familia y la policía se ven envueltos en un misterio sobrenatural en Hawkins.',
  },
  'breaking': {
    'titulo': 'Breaking Bad',
    'imagen': '$tmdb/ggFHVNu6YYI5L9pCfOacjizRGt.jpg',
    'anio': 2008,
    'edad': '18+',
    'temporadas': 5,
    'genero': 'Drama',
    'coincidencia': 97,
    'descripcion':
        'Un profesor de química con cáncer terminal se asocia con un exalumno para fabricar y vender metanfetamina.',
  },
  'casa': {
    'titulo': 'La casa de papel',
    'imagen': '$tmdb/reEMJA1uzscCbkpeRJeTT2bjqUp.jpg',
    'anio': 2017,
    'edad': '16+',
    'temporadas': 5,
    'genero': 'Acción',
    'coincidencia': 95,
    'descripcion':
        'Ocho ladrones toman rehenes en la Fábrica Nacional de Moneda y Timbre mientras El Profesor manipula a la policía.',
  },
  'merlina': {
    'titulo': 'Merlina',
    'imagen': '$tmdb/9PFonBhy4cQy7Jz20NpMygczOkv.jpg',
    'anio': 2022,
    'edad': '13+',
    'temporadas': 2,
    'genero': 'Comedia',
    'coincidencia': 93,
    'descripcion':
        'Merlina Addams investiga una ola de asesinatos mientras hace amigos y enemigos en la Academia Nevermore.',
  },
  'squid': {
    'titulo': 'El juego del calamar',
    'imagen': '$tmdb/dDlEmu3EZ0Pgg93K2SVNLCjCSvE.jpg',
    'anio': 2021,
    'edad': '16+',
    'temporadas': 3,
    'genero': 'Suspenso',
    'coincidencia': 96,
    'descripcion':
        'Cientos de jugadores endeudados aceptan una extraña invitación para competir en juegos infantiles con un premio millonario.',
  },
  'witcher': {
    'titulo': 'The Witcher',
    'imagen': '$tmdb/7vjaCdMw15FEbXyLQTVa04URsPm.jpg',
    'anio': 2019,
    'edad': '18+',
    'temporadas': 4,
    'genero': 'Fantasía',
    'coincidencia': 90,
    'descripcion':
        'Geralt de Rivia, un cazador de monstruos, lucha por encontrar su lugar en un mundo donde las personas son más malvadas que las bestias.',
  },
  'dark': {
    'titulo': 'Dark',
    'imagen': '$tmdb/apbrbWs8M9lyOpJYU5WXrpFbk1Z.jpg',
    'anio': 2017,
    'edad': '16+',
    'temporadas': 3,
    'genero': 'Ciencia ficción',
    'coincidencia': 94,
    'descripcion':
        'La desaparición de dos niños en un pueblo alemán revela los secretos de cuatro familias a lo largo de varias generaciones.',
  },
  'narcos': {
    'titulo': 'Narcos: México',
    'imagen': '$tmdb/rTmal9fDbwh5F0waol2hq35U4ah.jpg',
    'anio': 2018,
    'edad': '18+',
    'temporadas': 3,
    'genero': 'Crimen',
    'coincidencia': 91,
    'descripcion':
        'La historia del nacimiento del cártel de Guadalajara y la guerra contra las drogas en México.',
  },
  'crown': {
    'titulo': 'The Crown',
    'imagen': '$tmdb/1M876KPjulVwppEpldhdc8V4o68.jpg',
    'anio': 2016,
    'edad': '16+',
    'temporadas': 6,
    'genero': 'Drama',
    'coincidencia': 88,
    'descripcion':
        'La vida de la reina Isabel II y los acontecimientos políticos que marcaron la segunda mitad del siglo XX.',
  },
  'bridgerton': {
    'titulo': 'Bridgerton',
    'imagen': '$tmdb/luoKpgVwi1E5nQsi7W0UuKHu2Rq.jpg',
    'anio': 2020,
    'edad': '16+',
    'temporadas': 3,
    'genero': 'Romance',
    'coincidencia': 87,
    'descripcion':
        'Los ocho hermanos Bridgerton buscan el amor y la felicidad en la alta sociedad londinense de la Regencia.',
  },
  'ozark': {
    'titulo': 'Ozark',
    'imagen': '$tmdb/pCGyPVrI9Fzw6rE1Pvi4BIXF6ET.jpg',
    'anio': 2017,
    'edad': '18+',
    'temporadas': 4,
    'genero': 'Crimen',
    'coincidencia': 92,
    'descripcion':
        'Un asesor financiero arrastra a su familia a los Ozarks, donde debe lavar dinero para apaciguar a un capo de la droga.',
  },
  'black': {
    'titulo': 'Black Mirror',
    'imagen': '$tmdb/7PRddO7z7mcPi21nZTCMGShAyy1.jpg',
    'anio': 2011,
    'edad': '18+',
    'temporadas': 7,
    'genero': 'Ciencia ficción',
    'coincidencia': 89,
    'descripcion':
        'Antología que explora el lado oscuro de la tecnología y su impacto en la sociedad moderna.',
  },
};

// Filas de la pantalla de inicio: Lista de Mapas
final List<Map<String, dynamic>> categorias = [
  {
    'titulo': 'Tendencias ahora',
    'items': ['squid', 'merlina', 'stranger', 'casa', 'witcher', 'dark'],
  },
  {
    'titulo': 'Top 10 en Perú hoy',
    'top': true,
    'items': ['merlina', 'squid', 'bridgerton', 'casa', 'ozark', 'narcos'],
  },
  {
    'titulo': 'Series de crimen',
    'items': ['breaking', 'narcos', 'ozark', 'casa', 'dark'],
  },
  {
    'titulo': 'Aclamadas por la crítica',
    'items': ['crown', 'black', 'dark', 'breaking', 'stranger', 'witcher'],
  },
];

Map<String, dynamic> buscar(String id) => titulos[id]!;
