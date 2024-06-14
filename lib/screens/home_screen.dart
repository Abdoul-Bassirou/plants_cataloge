import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../theme/colors.dart';
import '../theme/app_theme.dart';
import 'detail_screen.dart';
import 'settings_screen.dart';
import 'login_screen.dart';
import 'SignUpScreen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;



class HomeScreen extends StatefulWidget {
  final Function onThemeChanged;

  const HomeScreen({super.key, required this.onThemeChanged});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Plant> plants = [
    Plant(
      name: 'Aloe Vera',
      scientificName: 'Aloe barbadensis miller',
      family: 'Xanthorrhoeaceae',
      origin: 'Afrique du Nord',
      imageUrl: 'assets/aloe vera.jpg',
      description: 'L’aloe vera est une plante succulente connue pour ses feuilles épaisses et charnues contenant un gel aux propriétés apaisantes et cicatrisantes. Elle est utilisée depuis des siècles pour traiter les brûlures, les coupures, les irritations cutanées et autres affections. En plus de ses usages médicinaux, l’aloe vera est également une plante d’intérieur populaire.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Basilic',
      scientificName: 'Ocimum basilicum',
      family: 'Lamiaceae',
      origin: 'Inde',
      imageUrl: 'assets/basil.jpg',
      description: 'Le basilic est une herbe aromatique largement utilisée en cuisine pour son parfum et sa saveur uniques. Il existe de nombreuses variétés de basilic, chacune avec son propre profil aromatique. En plus de ses usages culinaires, le basilic possède également des propriétés médicinales et est utilisé en médecine traditionnelle pour traiter divers maux.',
      category: 'Culinary',
    ),
    Plant(
      name: 'Plante araignée',
      scientificName: 'Chlorophytum comosum',
      family: 'Asparagaceae',
      origin: 'Afrique australe',
      imageUrl: 'assets/Spider Plant.jpg',
      description: 'La plante araignée est une plante d’intérieur très populaire en raison de sa facilité d’entretien et de ses propriétés purificatrices d’air. Elle produit de longues feuilles arquées et des stolons qui portent de petites plantules, lui donnant son aspect caractéristique. La plante araignée est également non toxique pour les animaux de compagnie.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Plante serpent',
      scientificName: 'Sansevieria trifasciata',
      family: 'Asparagaceae',
      origin: 'Afrique de l’Ouest',
      imageUrl: 'assets/Snake Plan.jpg',
      description: 'La plante serpent, également connue sous le nom de langue de belle-mère, est une plante d’intérieur très résistante qui tolère bien la négligence. Elle est appréciée pour ses feuilles dressées et pointues, souvent panachées de vert et de jaune. La plante serpent est également très efficace pour purifier l’air intérieur.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Spathiphyllum',
      scientificName: 'Spathiphyllum',
      family: 'Araceae',
      origin: 'Amérique tropicale',
      imageUrl: 'assets/Peace Lily.jpg',
      description: 'Le Spathiphyllum, ou lis de la paix, est une plante d’intérieur élégante connue pour ses belles fleurs blanches en forme de spathe. Il est relativement facile à entretenir et tolère bien les conditions de faible luminosité. Le Spathiphyllum est également efficace pour purifier l’air intérieur.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Mélisse',
      scientificName: 'Melissa officinalis',
      family: 'Lamiaceae',
      origin: 'Europe',
      imageUrl: 'assets/Lemon Balm.jpg',
      description: 'La mélisse est une herbe aromatique au parfum citronné, utilisée depuis des siècles pour ses propriétés calmantes et relaxantes. Elle est souvent consommée sous forme de tisane pour favoriser le sommeil et soulager l’anxiété. La mélisse est également utilisée en cuisine pour aromatiser les plats et les boissons.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Ficus',
      scientificName: 'Ficus benjamina',
      family: 'Moraceae',
      origin: 'Asie du Sud-Est',
      imageUrl: 'assets/ficus.jpg',
      description: 'Le ficus benjamina, ou figuier pleureur, est une plante d’intérieur populaire pour son feuillage luxuriant et son port élégant. Il existe de nombreuses variétés de ficus, avec des feuilles de différentes formes et couleurs. Le ficus nécessite un emplacement lumineux et un arrosage régulier pour prospérer.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Rose',
      scientificName: 'Rosa',
      family: 'Rosaceae',
      origin: 'Asie',
      imageUrl: 'assets/rose cubitus.jpg',
      description: 'La rose est une fleur emblématique, symbole de l’amour, de la beauté et de la passion. Il existe des milliers de variétés de roses, avec des couleurs, des formes et des parfums variés. Les roses sont cultivées dans le monde entier pour leur beauté ornementale et pour la production d’huile essentielle utilisée en parfumerie et en cosmétique.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Camomille',
      scientificName: 'Matricaria chamomilla',
      family: 'Asteraceae',
      origin: 'Europe',
      imageUrl: 'assets/chamoli.jpg',
      description: 'La camomille est une plante herbacée connue pour ses petites fleurs blanches ressemblant à des marguerites. Elle est utilisée depuis des siècles pour ses propriétés médicinales, notamment pour favoriser le sommeil, soulager les troubles digestifs et calmer les inflammations. La camomille est souvent consommée sous forme de tisane.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Persil',
      scientificName: 'Petroselinum crispum',
      family: 'Apiaceae',
      origin: 'Méditerranée',
      imageUrl: 'assets/Parsley.jpg',
      description: 'Le persil est une herbe aromatique largement utilisée en cuisine pour sa saveur fraîche et légèrement poivrée. Il est riche en vitamines et minéraux, notamment en vitamine C et en fer. Le persil est souvent utilisé comme garniture, mais il peut également être ajouté aux salades, aux soupes et aux sauces.',
      category: 'Culinary',
    ),
    Plant(
      name: 'Thym',
      scientificName: 'Thymus vulgaris',
      family: 'Lamiaceae',
      origin: 'Méditerranée',
      imageUrl: 'assets/Thyme.jpg',
      description: 'Le thym est une herbe aromatique au parfum puissant, utilisée en cuisine pour aromatiser les viandes, les légumes et les sauces. Il possède également des propriétés médicinales et est utilisé pour traiter les infections respiratoires, les troubles digestifs et les problèmes de peau. Le thym est souvent consommé sous forme de tisane ou d’huile essentielle.',
      category: 'Culinary',
    ),
    Plant(
      name: 'Orchidée',
      scientificName: 'Orchidaceae',
      family: 'Orchidaceae',
      origin: 'Monde entier',
      imageUrl: 'assets/Orchid.jpg',
      description: 'Les orchidées sont une famille de plantes à fleurs très diversifiée, connue pour leurs fleurs exotiques et souvent spectaculaires. Elles sont appréciées pour leur beauté ornementale et sont cultivées dans le monde entier. Les orchidées nécessitent des soins spécifiques pour prospérer, notamment en termes d’humidité et de lumière.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Ginseng',
      scientificName: 'Panax',
      family: 'Araliaceae',
      origin: 'Asie de l’Est',
      imageUrl: 'assets/Ginseng.jpg',
      description: 'Le ginseng est une plante médicinale utilisée depuis des siècles en médecine traditionnelle chinoise et coréenne. Il est réputé pour ses propriétés adaptogènes, qui aident l’organisme à s’adapter au stress. Le ginseng est également utilisé pour améliorer la performance cognitive, stimuler le système immunitaire et augmenter l’énergie.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Sauge',
      scientificName: 'Salvia officinalis',
      family: 'Lamiaceae',
      origin: 'Méditerranée',
      imageUrl: 'assets/Sage.jpg',
      description: 'La sauge est une herbe aromatique au parfum puissant, utilisée en cuisine pour aromatiser les viandes, les légumes et les sauces. Elle possède également des propriétés médicinales et est utilisée pour traiter les troubles digestifs, les maux de gorge et les problèmes de peau. La sauge est souvent consommée sous forme de tisane ou d’huile essentielle.',
      category: 'Culinary',
    ),
    Plant(
      name: 'Cactus',
      scientificName: 'Cactaceae',
      family: 'Cactaceae',
      origin: 'Amériques',
      imageUrl: 'assets/Carcus.jpeg',
      description: 'Les cactus sont des plantes succulentes adaptées aux environnements arides et désertiques. Ils sont connus pour leurs formes variées, leurs épines et leurs fleurs souvent spectaculaires. Les cactus sont populaires comme plantes d’intérieur en raison de leur facilité d’entretien et de leur résistance à la sécheresse.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Menthe poivrée',
      scientificName: 'Mentha × piperita',
      family: 'Lamiaceae',
      origin: 'Europe',
      imageUrl: 'assets/Perpermint.jpeg',
      description: 'La menthe poivrée est une herbe aromatique au parfum frais et mentholé, largement utilisée en cuisine, en confiserie et en cosmétique. Elle est également utilisée pour ses propriétés médicinales, notamment pour soulager les troubles digestifs, les maux de tête et les douleurs musculaires. La menthe poivrée est souvent consommée sous forme de tisane ou d’huile essentielle.',
      category: 'Culinary',
    ),
    Plant(
      name: 'Pissenlit',
      scientificName: 'Taraxacum officinale',
      family: 'Asteraceae',
      origin: 'Eurasie',
      imageUrl: 'assets/dandelion.jpg',
      description: 'Le pissenlit est une plante herbacée commune, souvent considérée comme une mauvaise herbe. Cependant, il possède de nombreuses propriétés médicinales et est utilisé pour traiter les troubles digestifs, les problèmes de foie et les affections cutanées. Les feuilles de pissenlit sont également comestibles et peuvent être ajoutées aux salades.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Jasmin',
      scientificName: 'Jasminum',
      family: 'Oleaceae',
      origin: 'Eurasie',
      imageUrl: 'assets/jasmine.jpg',
      description: 'Le jasmin est un genre de plantes à fleurs connu pour son parfum délicat et enivrant. Les fleurs de jasmin sont utilisées pour la production d’huile essentielle utilisée en parfumerie et en cosmétique. Le jasmin est également une plante ornementale populaire, cultivée pour ses belles fleurs blanches ou jaunes.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Aneth',
      scientificName: 'Anethum graveolens',
      family: 'Apiaceae',
      origin: 'Asie du Sud-Ouest',
      imageUrl: 'assets/dill.jpg',
      description: 'L’aneth est une herbe aromatique utilisée en cuisine pour sa saveur fraîche et légèrement anisée. Les feuilles et les graines d’aneth sont utilisées pour aromatiser les poissons, les légumes et les sauces. L’aneth possède également des propriétés médicinales et est utilisé pour traiter les troubles digestifs et favoriser la lactation.',
      category: 'Culinary',
    ),
    Plant(
      name: 'Bambou',
      scientificName: 'Bambusoideae',
      family: 'Poaceae',
      origin: 'Asie',
      imageUrl: 'assets/bamboo.jpg',
      description: 'Le bambou est une plante à croissance rapide, connue pour ses tiges ligneuses et creuses. Il est utilisé dans de nombreux domaines, notamment la construction, l’artisanat, la cuisine et la médecine traditionnelle. Le bambou est également une plante ornementale populaire, cultivée pour son aspect exotique.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Calendula',
      scientificName: 'Calendula officinalis',
      family: 'Asteraceae',
      origin: 'Europe',
      imageUrl: 'assets/calendula.jpg',
      description: 'Le calendula, ou souci officinal, est une plante herbacée connue pour ses fleurs orange vif. Il est utilisé depuis des siècles pour ses propriétés médicinales, notamment pour traiter les plaies, les brûlures, les inflammations et les affections cutanées. Le calendula est souvent utilisé sous forme de crème, d’onguent ou de tisane.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Gingembre',
      scientificName: 'Zingiber officinale',
      family: 'Zingiberaceae',
      origin: 'Asie du Sud-Est',
      imageUrl: 'assets/Ginseng.jpg',
      description: 'Le gingembre est une plante rhizomateuse utilisée depuis des siècles en cuisine et en médecine traditionnelle. Il est réputé pour son goût piquant et ses propriétés digestives. Le gingembre est également utilisé pour traiter les nausées, les douleurs musculaires et les inflammations. Il est souvent consommé frais, séché, en poudre ou sous forme de tisane.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Eucalyptus',
      scientificName: 'Eucalyptus',
      family: 'Myrtaceae',
      origin: 'Australie',
      imageUrl: 'assets/eucalyptus.jpg',
      description: 'L’eucalyptus est un genre d’arbres et d’arbustes connu pour son parfum caractéristique et ses propriétés médicinales. L’huile essentielle d’eucalyptus est utilisée pour traiter les affections respiratoires, les douleurs musculaires et les problèmes de peau. L’eucalyptus est également utilisé en parfumerie et en cosmétique.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Ananas',
      scientificName: 'Ananas comosus',
      family: 'Bromeliaceae',
      origin: 'Amérique du Sud',
      imageUrl: 'assets/Pineapple.jpg',
      description: 'L’ananas est un fruit tropical délicieux et rafraîchissant, connu pour sa chair juteuse et sucrée. Il est riche en vitamines et minéraux, notamment en vitamine C et en manganèse. L’ananas est consommé frais, en jus ou utilisé dans diverses préparations culinaires.',
      category: 'Fruit',
    ),
    Plant(
      name: 'Pomme',
      scientificName: 'Malus domestica',
      family: 'Rosaceae',
      origin: 'Asie centrale',
      imageUrl: 'assets/Apple.jpg',
      description: 'La pomme est un fruit populaire, apprécié pour sa saveur sucrée ou acidulée et sa texture croquante. Il existe de nombreuses variétés de pommes, avec des couleurs et des saveurs variées. Les pommes sont consommées fraîches, cuites ou utilisées dans la préparation de jus, de compotes et de desserts.',
      category: 'Fruit',
    ),
    Plant(
      name: 'Carotte',
      scientificName: 'Daucus carota',
      family: 'Apiaceae',
      origin: 'Iran et Afghanistan',
      imageUrl: 'assets/Carrot.jpg',
      description: 'La carotte est un légume racine riche en bêta-carotène, un précurseur de la vitamine A. Elle est connue pour sa couleur orange vif et sa saveur sucrée. Les carottes sont consommées crues, cuites ou utilisées dans la préparation de jus et de soupes.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Tomate',
      scientificName: 'Solanum lycopersicum',
      family: 'Solanaceae',
      origin: 'Amérique du Sud',
      imageUrl: 'assets/tomato.jpg',
      description: 'La tomate est un fruit-légume largement utilisé en cuisine. Elle est appréciée pour sa saveur acidulée et sa polyvalence. Les tomates sont consommées fraîches, cuites ou utilisées dans la préparation de sauces, de salades et de nombreux autres plats.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Poivron',
      scientificName: 'Capsicum annuum',
      family: 'Solanaceae',
      origin: 'Mexique',
      imageUrl: 'assets/bell_pepper.jpg',
      description: 'Le poivron est un fruit-légume disponible en différentes couleurs, notamment rouge, jaune, vert et orange. Il est apprécié pour sa saveur douce et légèrement sucrée. Les poivrons sont consommés crus, cuits ou utilisés dans la préparation de salades, de plats sautés et de farces.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Épinard',
      scientificName: 'Spinacia oleracea',
      family: 'Amaranthaceae',
      origin: 'Perse',
      imageUrl: 'assets/spinach.jpg',
      description: 'L’épinard est un légume-feuille riche en vitamines et minéraux, notamment en vitamine K, en vitamine A et en fer. Il est consommé cru, cuit ou utilisé dans la préparation de salades, de soupes et de plats sautés.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Tournesol',
      scientificName: 'Helianthus annuus',
      family: 'Asteraceae',
      origin: 'Amérique du Nord',
      imageUrl: 'assets/sunflower.jpg',
      description: 'Le tournesol est une plante annuelle connue pour ses grandes fleurs jaunes et ses graines comestibles. Les graines de tournesol sont riches en huile végétale et sont consommées grillées, salées ou utilisées dans la préparation de pain et de pâtisseries.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Concombre',
      scientificName: 'Cucumis sativus',
      family: 'Cucurbitaceae',
      origin: 'Asie du Sud',
      imageUrl: 'assets/cucumber.jpg',
      description: 'Le concombre est un légume rafraîchissant, apprécié pour sa saveur douce et sa texture croquante. Il est consommé cru, en salade, ou utilisé dans la préparation de cornichons et de boissons rafraîchissantes.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Citrouille',
      scientificName: 'Cucurbita pepo',
      family: 'Cucurbitaceae',
      origin: 'Amérique du Nord',
      imageUrl: 'assets/pumpkin.jpg',
      description: 'La citrouille est un fruit-légume de grande taille, utilisé en cuisine pour sa chair savoureuse et ses graines comestibles. La citrouille est également utilisée pour la décoration, notamment lors de la fête d’Halloween.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Fraise',
      scientificName: 'Fragaria × ananassa',
      family: 'Rosaceae',
      origin: 'Monde entier',
      imageUrl: 'assets/Strawberry.jpg',
      description: 'La fraise est un fruit rouge apprécié pour sa saveur sucrée et acidulée. Elle est riche en vitamine C et en antioxydants. Les fraises sont consommées fraîches, en confiture, en pâtisserie ou utilisées dans la préparation de desserts.',
      category: 'Fruit',
    ),
    Plant(
      name: 'Cerise',
      scientificName: 'Prunus avium',
      family: 'Rosaceae',
      origin: 'Europe et Asie',
      imageUrl: 'assets/cherry.jpg',
      description: 'La cerise est un petit fruit rond, disponible en différentes variétés, avec des couleurs et des saveurs variées. Les cerises sont consommées fraîches, en confiture, en pâtisserie ou utilisées dans la préparation de desserts.',
      category: 'Fruit',
    ),
    Plant(
      name: 'Laitue',
      scientificName: 'Lactuca sativa',
      family: 'Asteraceae',
      origin: 'Égypte',
      imageUrl: 'assets/lettuce.jpg',
      description: 'La laitue est un légume-feuille consommé cru, principalement en salade. Il existe de nombreuses variétés de laitue, avec des formes, des couleurs et des textures variées. La laitue est une source de vitamines et de minéraux.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Romarin',
      scientificName: 'Salvia rosmarinus',
      family: 'Lamiaceae',
      origin: 'Méditerranée',
      imageUrl: 'assets/rosary.jpg',
      description: 'Le romarin est une herbe aromatique au parfum puissant, utilisée en cuisine pour aromatiser les viandes, les légumes et les sauces. Il possède également des propriétés médicinales et est utilisé pour améliorer la mémoire, stimuler la circulation sanguine et soulager les douleurs musculaires.',
      category: 'Culinary',
    ),
    Plant(
      name: 'Origan',
      scientificName: 'Origanum vulgare',
      family: 'Lamiaceae',
      origin: 'Europe',
      imageUrl: 'assets/oregano.jpg',
      description: 'L’origan est une herbe aromatique largement utilisée en cuisine méditerranéenne. Il possède une saveur forte et légèrement amère. L’origan est souvent utilisé pour aromatiser les pizzas, les sauces tomates et les plats de viande.',
      category: 'Culinary',
    ),
    Plant(
      name: 'Pivoine',
      scientificName: 'Paeonia',
      family: 'Paeoniaceae',
      origin: 'Europe et Asie',
      imageUrl: 'assets/Peony.jpg',
      description: 'La pivoine est une plante vivace appréciée pour ses grandes fleurs parfumées. Il existe de nombreuses variétés de pivoines, avec des couleurs variées, allant du blanc au rouge foncé. Les pivoines sont souvent cultivées dans les jardins pour leur beauté ornementale.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Lilas',
      scientificName: 'Syringa',
      family: 'Oleaceae',
      origin: 'Europe et Asie',
      imageUrl: 'assets/Lilac.jpg',
      description: 'Le lilas est un arbuste à fleurs connu pour ses panicules de fleurs parfumées, généralement de couleur lilas, mais aussi blanches, roses ou violettes. Il est souvent cultivé dans les jardins pour son parfum et sa beauté ornementale.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Azalée',
      scientificName: 'Rhododendron',
      family: 'Ericaceae',
      origin: 'Asie',
      imageUrl: 'assets/Azalea.jpg',
      description: 'L’azalée est un arbuste à fleurs appartenant au genre Rhododendron. Elle est appréciée pour ses fleurs abondantes et colorées, qui apparaissent au printemps. Les azalées sont souvent cultivées en pot ou en pleine terre dans les jardins.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Hortensia',
      scientificName: 'Hydrangea',
      family: 'Hydrangeaceae',
      origin: 'Asie et Amériques',
      imageUrl: 'assets/Hydrangea.jpg',
      description: 'L’hortensia est un arbuste à fleurs connu pour ses grandes inflorescences globuleuses, composées de nombreuses petites fleurs. Les hortensias sont disponibles dans une variété de couleurs, notamment le rose, le bleu, le blanc et le violet.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Souci',
      scientificName: 'Tagetes',
      family: 'Asteraceae',
      origin: 'Amérique du Nord et du Sud',
      imageUrl: 'assets/Marigold.jpg',
      description: 'Le souci est une plante annuelle connue pour ses fleurs jaunes ou orange vif. Il est souvent cultivé dans les jardins pour sa beauté ornementale et pour repousser les insectes nuisibles.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Hibiscus',
      scientificName: 'Hibiscus',
      family: 'Malvaceae',
      origin: 'Régions tropicales',
      imageUrl: 'assets/Hibiscus.jpg',
      description: 'L’hibiscus est un genre de plantes à fleurs connu pour ses grandes fleurs colorées, souvent utilisées pour la décoration et la préparation de tisanes. Certaines espèces d’hibiscus sont également cultivées pour leurs fruits comestibles.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Tulipe',
      scientificName: 'Tulipa',
      family: 'Liliaceae',
      origin: 'Asie centrale',
      imageUrl: 'assets/Tulip1.jpg',
      description: 'La tulipe est une plante bulbeuse à fleurs, appréciée pour ses fleurs en forme de coupe, disponibles dans une large gamme de couleurs. Les tulipes sont souvent cultivées dans les jardins et sont un symbole du printemps.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Jonquille',
      scientificName: 'Narcissus',
      family: 'Amaryllidaceae',
      origin: 'Europe',
      imageUrl: 'assets/Daffodil.jpg',
      description: 'La jonquille est une plante bulbeuse à fleurs, connue pour ses fleurs jaunes en forme de trompette. Elle est souvent cultivée dans les jardins et est un symbole du printemps.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Lavande',
      scientificName: 'Lavandula',
      family: 'Lamiaceae',
      origin: 'Méditerranée',
      imageUrl: 'assets/Lavende.jpg',
      description: 'La lavande est une plante aromatique connue pour ses fleurs violettes parfumées et ses propriétés calmantes. L’huile essentielle de lavande est utilisée en aromathérapie pour favoriser la relaxation et le sommeil.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Menthe',
      scientificName: 'Mentha',
      family: 'Lamiaceae',
      origin: 'Europe et Asie',
      imageUrl: 'assets/Mint.jpg',
      description: 'La menthe est un genre de plantes aromatiques utilisées en cuisine, en confiserie et en médecine traditionnelle. Les feuilles de menthe sont utilisées pour aromatiser les plats, les boissons et les desserts. La menthe possède également des propriétés digestives et rafraîchissantes.',
      category: 'Culinary',
    ),
    Plant(
      name: 'Kinkeliba',
      scientificName: 'Combretum micranthum',
      family: 'Combretaceae',
      origin: 'Afrique de l’Ouest',
      imageUrl: 'assets/kinkeliba.jpg',
      description: 'Le kinkeliba est un arbuste originaire d’Afrique de l’Ouest, utilisé en médecine traditionnelle pour ses propriétés diurétiques, digestives et anti-inflammatoires. Les feuilles de kinkeliba sont utilisées pour préparer une boisson chaude, souvent consommée après les repas.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Ortie',
      scientificName: 'Urtica dioica',
      family: 'Urticaceae',
      origin: 'Europe, Asie et Afrique du Nord',
      imageUrl: 'assets/Nettle.jpg',
      description: 'L’ortie est une plante herbacée connue pour ses poils urticants qui provoquent des démangeaisons. Malgré cela, l’ortie est utilisée en médecine traditionnelle pour ses propriétés diurétiques, anti-inflammatoires et antiallergiques. Les jeunes feuilles d’ortie sont également comestibles et peuvent être consommées cuites comme des épinards.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Mangue',
      scientificName: 'Mangifera indica',
      family: 'Anacardiaceae',
      origin: 'Asie du Sud',
      imageUrl: 'assets/Mango.jpg',
      description: 'La mangue est un fruit tropical apprécié pour sa chair juteuse et sucrée, disponible en différentes variétés avec des couleurs et des saveurs variées. La mangue est riche en vitamines et minéraux, notamment en vitamine C et en vitamine A.',
      category: 'Fruit',
    ),
    Plant(
      name: 'Neem',
      scientificName: 'Azadirachta indica',
      family: 'Meliaceae',
      origin: 'Sous-continent indien',
      imageUrl: 'assets/Neem.jpg',
      description: 'Le neem est un arbre originaire du sous-continent indien, utilisé depuis des siècles en médecine traditionnelle pour ses propriétés antibactériennes, antifongiques et antivirales. Les feuilles, l’écorce et les graines de neem sont utilisées pour traiter diverses affections, notamment les problèmes de peau, les infections et les parasites.',
      category: 'Medicinal',
    ),
    Plant(
      name: 'Papaye',
      scientificName: 'Carica papaya',
      family: 'Caricaceae',
      origin: 'Amérique centrale',
      imageUrl: 'assets/Papaya.jpg',
      description: 'La papaye est un fruit tropical apprécié pour sa chair douce et juteuse, riche en vitamine C et en papaïne, une enzyme digestive. La papaye est consommée fraîche, en jus ou utilisée dans la préparation de salades et de desserts.',
      category: 'Fruit',
    ),
    Plant(
      name: 'Goyave',
      scientificName: 'Psidium guajava',
      family: 'Myrtaceae',
      origin: 'Amérique centrale',
      imageUrl: 'assets/Guava.jpg',
      description: 'La goyave est un fruit tropical apprécié pour sa saveur unique et ses nombreux bienfaits pour la santé. Elle est riche en vitamine C, en fibres et en antioxydants. La goyave est consommée fraîche, en jus ou utilisée dans la préparation de confitures et de desserts.',
      category: 'Fruit',
    ),
    Plant(
      name: 'Palmier',
      scientificName: 'Arecaceae',
      family: 'Arecaceae',
      origin: 'Régions tropicales',
      imageUrl: 'assets/Palm.jpg',
      description: 'Les palmiers sont une famille d’arbres tropicaux et subtropicaux, connus pour leurs grandes feuilles en éventail et leurs fruits souvent comestibles. Les palmiers sont utilisés pour l’aménagement paysager, la production de fruits (comme les noix de coco et les dattes) et la fabrication de matériaux de construction.',
      category: 'Decorative',
    ),
    Plant(
      name: 'Noix de coco',
      scientificName: 'Cocos nucifera',
      family: 'Arecaceae',
      origin: 'Régions tropicales',
      imageUrl: 'assets/Coconut.jpg',
      description: 'La noix de coco est un fruit tropical polyvalent, utilisé pour sa chair, son lait, son huile et sa fibre. La chair de noix de coco est consommée fraîche, séchée ou utilisée dans la préparation de desserts et de plats salés. Le lait de coco est utilisé en cuisine et en cosmétique. L’huile de coco est utilisée en cuisine, en cosmétique et en médecine traditionnelle.',
      category: 'Fruit',
    ),
    Plant(
      name: 'Laurier',
      scientificName: 'Laurus nobilis',
      family: 'Lauraceae',
      origin: 'Méditerranée',
      imageUrl: 'assets/Bay Laurel.jpg',
      description: 'Le laurier est un arbre aromatique utilisé en cuisine pour ses feuilles parfumées. Les feuilles de laurier sont utilisées pour aromatiser les soupes, les ragoûts, les sauces et les marinades. Le laurier est également utilisé en médecine traditionnelle pour ses propriétés digestives et anti-inflammatoires.',
      category: 'Herb',
    ),
    Plant(
      name: 'Pomme',
      scientificName: 'Malus domestica',
      family: 'Rosaceae',
      origin: 'Asie centrale',
      imageUrl: 'assets/Apple.jpg',
      description: 'La pomme est un fruit populaire, apprécié pour sa saveur sucrée ou acidulée et sa texture croquante. Il existe de nombreuses variétés de pommes, avec des couleurs et des saveurs variées. Les pommes sont consommées fraîches, cuites ou utilisées dans la préparation de jus, de compotes et de desserts.',
      category: 'Fruit',
    ),
    Plant(
      name: 'Carotte',
      scientificName: 'Daucus carota',
      family: 'Apiaceae',
      origin: 'Perse',
      imageUrl: 'assets/Carrot.jpg',
      description: 'La carotte est un légume racine riche en bêta-carotène, un précurseur de la vitamine A. Elle est connue pour sa couleur orange vif et sa saveur sucrée. Les carottes sont consommées crues, cuites ou utilisées dans la préparation de jus et de soupes.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Chou',
      scientificName: 'Brassica oleracea',
      family: 'Brassicaceae',
      origin: 'Europe',
      imageUrl: 'assets/Cabbage.jpg',
      description: 'Le chou est un légume-feuille cultivé pour ses feuilles comestibles, qui peuvent être consommées crues, cuites ou fermentées. Il existe de nombreuses variétés de chou, avec des formes, des couleurs et des textures variées.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Baobab',
      scientificName: 'Adansonia',
      family: 'Malvaceae',
      origin: 'Afrique',
      imageUrl: 'assets/Baobab.jpg',
      description: 'Le baobab est un arbre emblématique de l’Afrique, connu pour son tronc massif et ses fruits comestibles. Les fruits du baobab sont riches en vitamine C, en calcium et en fibres. Ils sont consommés frais, séchés ou utilisés pour la préparation de boissons et de desserts.',
      category: 'Tree',
    ),
    Plant(
      name: 'Sorgho',
      scientificName: 'Sorghum bicolor',
      family: 'Poaceae',
      origin: 'Afrique du Nord-Est',
      imageUrl: 'assets/Sorghum.jpg',
      description: 'Le sorgho est une céréale cultivée pour ses grains comestibles, utilisés pour la production de farine, de semoule et de sirop. Le sorgho est également utilisé comme fourrage pour le bétail.',
      category: 'Grain',
    ),
    Plant(
      name: 'Aubergine africaine',
      scientificName: 'Solanum aethiopicum',
      family: 'Solanaceae',
      origin: 'Afrique',
      imageUrl: 'assets/African Eggplant.jpg',
      description: 'L’aubergine africaine est une espèce d’aubergine cultivée pour ses fruits comestibles, utilisés dans de nombreux plats africains. Les fruits de l’aubergine africaine sont généralement de couleur orange ou rouge et ont une saveur légèrement amère.',
      category: 'Vegetable',
    ),
    Plant(
      name: 'Igname',
      scientificName: 'Dioscorea',
      family: 'Dioscoreaceae',
      origin: 'Afrique et Asie',
      imageUrl: 'assets/Yam.jpg',
      description: 'L’igname est un tubercule comestible, riche en amidon et en nutriments. Elle est un aliment de base dans de nombreux pays tropicaux et subtropicaux. Les ignames sont consommées bouillies, frites, rôties ou utilisées dans la préparation de soupes et de ragoûts.',
      category: 'Vegetable',
    ),
  ];





  List<Plant> filteredPlants = [];
  List<Plant> favoritePlants = [];
  String _selectedCategory = 'All';
  int _selectedIndex = 0;
  @override


  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    filteredPlants = plants;
    favoritePlants = plants.where((plant) => plant.isFavorite).toList();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings();
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  void _toggleFavorite(Plant plant) {
    setState(() {
      plant.isFavorite = !plant.isFavorite;
      favoritePlants = plants.where((plant) => plant.isFavorite).toList();
      if (plant.isFavorite) {
        _scheduleNotification(
          'Reminder',
          'Don\'t forget to water ${plant.name}!',
          DateTime.now().add(const Duration(days: 1)),
        );
      }
    });
  }

  Future<void> _scheduleNotification(
      String title, String body, DateTime scheduledDate) async {
    // Instructions de débogage pour afficher les paramètres de la notification
    print('Titre de la notification : $title');
    print('Corps de la notification : $body');
    print('Date planifiée : $scheduledDate');

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  void _filterPlants(String query) {
    final results = plants.where((plant) =>
    plant.name.toLowerCase().contains(query.toLowerCase()) &&
        (_selectedCategory == 'All' || plant.category == _selectedCategory)).toList();
    setState(() {
      filteredPlants = results;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildPlantItem(BuildContext context, int index) {
    final plant = filteredPlants[index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(plant.imageUrl, fit: BoxFit.cover),
        ),
        title: Text(plant.name, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        subtitle: Text(plant.category, style: const TextStyle(color: AppColors.textSecondary)),
        trailing: IconButton(
          icon: Icon(
            plant.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: plant.isFavorite ? AppColors.favorite : null,
          ),
          onPressed: () {
            _toggleFavorite(plant);
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  PlantDetailsPage(plant: plant),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFavoriteItem(BuildContext context, int index) {
    final plant = favoritePlants[index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(plant.imageUrl, fit: BoxFit.cover),
        ),
        title: Text(plant.name, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        subtitle: Text(plant.category, style: const TextStyle(color: AppColors.textSecondary)),
        trailing: IconButton(
          icon: Icon(
            plant.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: AppColors.favorite,
          ),
          onPressed: () {
            _toggleFavorite(plant);
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  PlantDetailsPage(plant: plant),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: AppColors.primaryLight,
      child: const Text(
        '© 2024 Plant Catalog. All rights reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.textSecondary),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: AppColors.textOnPrimary,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.textPrimary),

            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              _onItemTapped(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: AppColors.textPrimary),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
              _onItemTapped(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: AppColors.textPrimary),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SettingsScreen(onThemeChanged: widget.onThemeChanged)),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.login, color: AppColors.textPrimary),
            title: const Text('Login'),
            onTap: () {
              Navigator.pop(context);
              _showLoginDialog();
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration, color: AppColors.textPrimary),
            title: const Text('Sign Up'),
            onTap: () {
              Navigator.pop(context);
              _showSignUpDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Login'),
          content: LoginScreen(),
        );
      },
    );
  }

  void _showSignUpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Sign Up'),
          content: SignUpScreen(),
        );
      },
    );
  }

  Widget _buildCategoryDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Filter by Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50, // Hauteur fixe pour les boutons
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildCategoryButton('All', Icons.all_inclusive, AppColors.primary),
                _buildCategoryButton('Medicinal', Icons.healing, Colors.green),
                _buildCategoryButton('Culinary', Icons.restaurant, Colors.orange),
                _buildCategoryButton('Decorative', Icons.nature, Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCategoryButton(String category, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          _selectedCategory = category;
          _filterPlants('');
        });
      },
      icon: Icon(icon, color: color),
      label: Text(category),
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedCategory == category ? color.withOpacity(0.8) : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      Column(
        children: [
          _buildCategoryDropdown(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                _filterPlants(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPlants.length,
              itemBuilder: _buildPlantItem,
            ),
          ),
        ],
      ),
      ListView.builder(
        itemCount: favoritePlants.length,
        itemBuilder: _buildFavoriteItem,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant Catalog'),
        backgroundColor: AppColors.primary,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications), // Utilisez l'icône de notification
            onPressed: () {
              // Redirigez l'utilisateur vers la page des notifications
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primary,
        onTap: _onItemTapped,
      ),
      bottomSheet: _buildFooter(),
    );
  }
}

// Définir la classe Notification en dehors de NotificationsScreen
class NotificationModel {
  final String title;
  final String body;
  final DateTime scheduledDate;

  NotificationModel({required this.title, required this.body, required this.scheduledDate});
}

// Définir la liste de notifications en dehors de NotificationsScreen
List<NotificationModel> notifications = [
  NotificationModel(
    title: 'Notification 1',
    body: 'N\'oubliez pas de vérifier l\'humidité du sol de vos plantes aujourd\'hui. Assurez-vous qu\'elles ne soient ni trop sèches ni trop humides. Un sol bien équilibré favorise une croissance optimale des plantes. Bon jardinage !',
    scheduledDate: DateTime.now(),
  ),
  NotificationModel(
    title: 'Notification 2',
    body: 'Pensez à inspecter régulièrement vos plantes pour détecter les signes de parasites ou de maladies. En agissant rapidement, vous pouvez éviter la propagation des problèmes et maintenir vos plantes en bonne santé. Bonne inspection !',
    scheduledDate: DateTime.now().add(const Duration(days: 1)),
  ),
  NotificationModel(
    title: 'Notification 3',
    body: 'Aujourd\'hui, prenez le temps de nettoyer les feuilles de vos plantes. La poussière et la saleté peuvent obstruer les pores des feuilles et entraver la photosynthèse. Un nettoyage régulier favorise une bonne santé pour vos plantes. Bon entretien !',
    scheduledDate: DateTime.now().add(const Duration(days: 2)),
  ),
  NotificationModel(
    title: 'Notification 4',
    body: 'Les plantes ont besoin de suffisamment de lumière pour prospérer. Assurez-vous que vos plantes reçoivent la quantité adéquate de lumière naturelle aujourd\'hui. Un bon éclairage favorise une croissance vigoureuse et une floraison abondante. Bonne journée lumineuse !',
    scheduledDate: DateTime.now().add(const Duration(days: 3)),
  ),
  NotificationModel(
    title: 'Notification 5',
    body: 'Pensez à tailler vos plantes aujourd\'hui pour encourager une croissance saine et bien structurée. L\'élagage régulier favorise également la production de nouvelles pousses et de fleurs. Bonne taille !',
    scheduledDate: DateTime.now().add(const Duration(days: 4)),
  ),
  NotificationModel(
    title: 'Notification 6',
    body: 'N\'oubliez pas de fertiliser vos plantes aujourd\'hui pour leur fournir les nutriments essentiels dont elles ont besoin. Un programme de fertilisation régulier favorise une croissance vigoureuse et une floraison abondante. Bon jardinage !',
    scheduledDate: DateTime.now().add(const Duration(days: 5)),
  ),
  NotificationModel(
    title: 'Notification 7',
    body: 'Vérifiez vos plantes pour détecter les signes de stress causés par des conditions environnementales inadéquates. Assurez-vous qu\'elles ne soient ni trop chaudes, ni trop froides, et qu\'elles reçoivent suffisamment d\'humidité. Bonne observation !',
    scheduledDate: DateTime.now().add(const Duration(days: 6)),
  ),
  NotificationModel(
    title: 'Notification 8',
    body: 'Aujourd\'hui, prenez le temps de repiquer vos plantes si elles deviennent trop à l\'étroit dans leur pot actuel. Un rempotage régulier favorise un développement racinaire sain et une croissance vigoureuse. Bonne transplantation !',
    scheduledDate: DateTime.now().add(const Duration(days: 7)),
  ),
  NotificationModel(
    title: 'Notification 9',
    body: 'Assurez-vous que vos plantes d\'intérieur ne souffrent pas de l\'accumulation de sels minéraux dans le sol. Rincez-les régulièrement à l\'eau claire pour éliminer les résidus de fertilisants. Un sol propre favorise une croissance saine. Bonne irrigation !',
    scheduledDate: DateTime.now().add(const Duration(days: 8)),
  ),
  NotificationModel(
    title: 'Notification 10',
    body: 'Aujourd\'hui, prenez le temps d\'inspecter vos plantes pour les signes de croissance anormale ou de décoloration des feuilles. Ces signes peuvent indiquer des problèmes de santé sous-jacents. Bonne observation et diagnostic !',
    scheduledDate: DateTime.now().add(const Duration(days: 9)),
  ),
];


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.body),
            trailing: Text(notification.scheduledDate.toString()),
          );
        },
      ),
    );
  }
}


