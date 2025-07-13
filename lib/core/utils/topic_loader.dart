import 'dart:math';

class TopicLoader {
  static final Map<String, List<String>> _topics = {
    'easy': [
      'Gatti', 'Cani', 'Ciabatte', 'Biscotti', 'Calzini',
      'Ombrelli', 'Mobili', 'Papere', 'Piante', 'Patatine',
      'Graffette', 'Candele', 'Unicorni', 'Danze', 'Scarpe',
      'Formaggi', 'Meme', 'Bottiglie', 'Palloncini', 'Fiocchi',
    ],
    'medium': [
      'Alieni spaziali', 'Criceti ballerini', 'Supereroi coraggiosi',
      'Armadi magici', 'Gelati giganti', 'Pinguini eleganti',
      'Telefoni rotti', 'Toast dorati', 'Vini pregiati',
      'Cactus spinosi', 'Sveglie rumorose', 'Bicchieri trasparenti',
      'Nuvole soffici', 'Zaini pesanti', 'Macchine veloci',
      'Tazze colorate', 'Occhiali neri', 'Monete antiche',
      'Pannelli solari', 'Spazzolini elettrici',
    ],
    'hard': [
      'Telecomandi e balene nel deserto',
      'Spaghetti che cantano canzoni tristi',
      'Freccette e astronavi in un garage',
      'Playlist create da criceti filosofi',
      'Frigoriferi che ballano tango al chiaro di luna',
      'Conversazioni tra cactus e robot',
      'Venti che sussurrano ricette segrete',
      'Chiese fatte di marshmallow',
      'Ascensori che viaggiano nel tempo',
      'Videogiochi creati da pinguini artisti',
      'Chiavi perdute nel triangolo delle Bermuda',
      'Lavastoviglie con sogni di gloria',
      'Biblioteche di caramelle gommose',
      'Sasso-Carta-Forbice con draghi invisibili',
      'Treni che si fermano per ammirare le stelle',
      'Esperimenti condotti da polpi scienziati',
      'Passaporti per universi paralleli',
      'Sculture fatte di spaghetti e luce',
      'Cartelli stradali che danno consigli filosofici',
      'Rompicapo ideati da unicorni pessimisti',
    ],
    'geek': [
      'Frontend', 'Backend', 'Algorithms', 'Database', 'Networking',
      'Server', 'JavaScript', 'CSS', 'HTML', 'Python', 'Java', 'C++',
      'Frameworks', 'API', 'Machine Learning', 'AI (Artificial Intelligence)',
      'Neural Networks', 'Robotics', 'Deep Fake', 'Quantum Computing',
      'Cybersecurity', 'Cloud computing', 'Operative Systems', 'Encryption',
      'Yellow Radiators', 'Google Developer Groups', 'User Interface',
      'Blockchain', 'CryptoCurrency', 'Hardware', '3D Printing',
      'Open-Source', 'DevOps', 'Container', 'Linux', 'Spegni e riaccendi',
      'BIT', 'File System', 'VPN', 'IoT (Internet of Things)', 'Big Data',
      'Brain Computer Interface', 'Chatbot', 'VR (Virtual Reality)',
      'AR (Augmented Reality)', 'Deep Learning', 'Game Development',
      'Web Development',
    ],
  };

  static String getRandomTopic(String difficulty) {
    final list = _topics[difficulty] ?? [];
    if (list.isEmpty) return 'Tema non disponibile';
    return list[Random().nextInt(list.length)];
  }
}
