if GetLocale() ~= 'frFR' then return end
SexyLib:Localization('Classic Achievements'):Add({
	-- #######
	-- Generic
	-- #######
    achievement_earned = '&aHaut fait obtenu par %s le %d/%d/%d',
    achievement_in_progress = '&7Haut fait en cours par %s',
	
	NOT_WORKING = 'ne fonctionne pas',
	
	-- ##################
	-- Icon in buttom bar
	-- ##################
	ICON_DESCRIPTION = '&7Clic-gauche : &eafficher/masquer les hauts faits\n&7Clic-droit : &eafficher les paramètres\n\n&3Avec l\'amour de Maxich :)\n&3Traduit par Qwaser ;)',

	-- ###############
	-- Settings window
	-- ###############
    OPTION_MICROBUTTON = 'Bouton dans menu',
    OPTION_MICROBUTTON_DESC = 'Si activé, l\'icône sera ajoutée dans la barre des menus du bas.\nAttention ! Cela peut altérer l\'interface si vous avez un addon qui la modifie.\n\nSi désactivé, l\'icône sera ajoutée à la minicarte.\n\nL\'interface doit être rechargée afin d\'être pris en compte.',
    OPTION_SHARING = 'Partager hauts faits',
    OPTION_SHARING_DESC = 'Partager la réalisation d\'un nouveau haut fait dans les discussions.',
	GOT_ACHIEVEMENT_MESSAGE_MALE = 'Je viens d\'obtenir le haut fait %s!',
    GOT_ACHIEVEMENT_MESSAGE_FEMALE = 'Je viens d\'obtenir le haut fait %s!',
	
    OPTION_UPDATE_MAP_EXPLORATION = 'Vérifier les zones explorées',
    OPTION_UPDATE_MAP_EXPLORATION_DESC = 'Analyser les zones déjà explorées afin de les comptabiliser pour les hauts faits.',
	UPDATING_EXPLORED_AREAS = 'Mise à jour des données des zones explorées. Cette opération peut prendre quelques secondes.',
    UPDATED_EXPLORED_AREAS = '&aLes données des zones explorées ont été mise à jour !',
	
	OPTION_RESET_ACHIEVEMENTS = 'Réinitialiser les hauts faits',
    OPTION_RESET_ACHIEVEMENTS_DESC = 'Réinitialiser tous les hauts faits de ce personnage.\n\nCette opération est irréversible !',

	-- #####################################
	-- Compare achievement with other player
	-- #####################################
    COMPARE_ACHIEVEMENTS = 'Comparer les hauts faits',
    TARGET_DOES_NOT_HAVE_ADDON = 'La cible n\'a pas l\'addon d\'installé.',

	-- #######################
	-- Achievements categories
	-- #######################
    CATEGORY_GENERAL = 'Général',
    CATEGORY_QUESTS = 'Quêtes',
    CATEGORY_KALIMDOR = 'Kalimdor',
    CATEGORY_EASTERN_KINGDOMS = 'Royaumes de l\'Est',
    CATEGORY_EXPLORATION = 'Exploration',
    CATEGORY_PVE = 'Donjons et raids',
    CATEGORY_INSTANCES = 'Donjons',
    CATEGORY_RAIDS = 'Raids',
	CATEGORY_WORLD_BOSSES = 'Boss de monde',
    CATEGORY_BATTLEGROUNDS = 'Joueur contre Joueur',
    CATEGORY_BG_ALTERAC = 'Vallée d\'Alterac',
    CATEGORY_BG_WARSONG = 'Goulet des Warsong',
    CATEGORY_BG_ARATHI = 'Bassin d\'Arathi',
    CATEGORY_PROFESSIONS = 'Métiers',
    CATEGORY_REPUTATION = 'Réputation',
    CATEGORY_FEATS_OF_STRENGTH = 'Tours de force',
    CATEGORY_EVENTS = 'Évènements mondiaux',
	
	-- ####################
	-- General achievements
	-- ####################
    AN_LVL = 'Niveau %d',
    AD_LVL = 'Atteindre le niveau %d.',
	
	AN_BANK = 'Chambre forte',
    AD_BANK = 'Acheter 6 emplacements de sac supplémentaires.',
    AC_BANK = 'A Acheter 6 emplacements de sac supplémentaires.',
	
	AN_MOB_KILLS_1 = 'Le tueur',
    AN_MOB_KILLS_2 = 'Destructeur',
    AN_MOB_KILLS_3 = 'Broyeur',
    AN_MOB_KILLS_4 = 'Chasseur de têtes',
    AN_MOB_KILLS_5 = 'Tempête de monstres',
    AN_MOB_KILLS_6 = 'Tempête de tout êtres vivants',
    AN_MOB_KILLS_7 = 'Mort omniprésente',
    AD_MOB_KILLS = 'Vaincre %d monstres.',
    AC_MOB_KILLS = 'A vaincu %d monstres.',
	
	AN_UNARMED_SKILL = 'Qui a commandé une salade de phalanges ?',
    AD_UNARMED_SKILL = 'Obtenir un score de 350 avec la compétence Mains nues.',
	SKILL_UNARMED = 'Mains nues',
    SKILL_RIDING = 'Monte',
	
	AN_UNCOMMON_GEAR = 'Plus si ordinaire',
    AD_UNCOMMON_GEAR = 'S\'équiper d’un objet de qualité inhabituel ou supérieure dans chaque emplacement.',
    AN_RARE_GEAR = 'Qualité supérieure',
    AD_RARE_GEAR = 'S\'équiper d’un objet de qualité rare ou supérieure dans chaque emplacement.',
    AN_EPIC_GEAR = 'Qualité épique',
    AD_EPIC_GEAR = 'S\'équiper d’un objet de qualité épique ou supérieure dans chaque emplacement.',	
    GEAR_SLOT_HEAD = 'Tête',
    GEAR_SLOT_NECK = 'Cou',
    GEAR_SLOT_SHOULDER = 'Épaule',
    GEAR_SLOT_CHEST = 'Torse',
    GEAR_SLOT_WAIST = 'Taille',
    GEAR_SLOT_LEGS = 'Jambes',
    GEAR_SLOT_FEET = 'Pieds',
    GEAR_SLOT_WRIST = 'Poignets',
    GEAR_SLOT_HANDS = 'Mains',
    GEAR_SLOT_FIRST_RING = 'Anneau gauche',
    GEAR_SLOT_SECOND_RING = 'Anneau droit',
    GEAR_SLOT_FIRST_TRINKET = 'Premier bijou',
    GEAR_SLOT_SECOND_TRINKET = 'Second bijou',
    GEAR_SLOT_CLOAK = 'Cape',
    GEAR_SLOT_WEAPON = 'Arme',
	
	-- ###################
	-- Quests achievements
	-- ###################
	-- Main category
    AN_QUESTS = '%d quêtes',
    AD_QUESTS = 'Achever %d quêtes.',
    AC_QUESTS = 'A achevé %d quêtes.',

    AN_QUEST_GOLD5 = 'Une juste récompense',
    AN_QUEST_GOLD10 = 'Collectionneur de belles pièces',
    AN_QUEST_GOLD25 = 'Gagne-pain',
    AN_QUEST_GOLD50 = 'Une récompense bien méritée',
    AN_QUEST_GOLD100 = 'Gagné à la sueur de son front',
    AD_QUEST_GOLD = 'Obtenir %d pièces d\'or en récompenses de quêtes.',
    AC_QUEST_GOLD = 'A obtenu %d pièces d\'or en récompenses de quêtes.',
	
	AN_WISDOM_KEEPER = 'Maître des traditions',
    AD_WISDOM_KEEPER = 'Accomplir les hauts faits de quêtes listés ci-dessous.',
	
	-- For all quest achievements
	AN_QUESTS_ZONE = 'Quêtes de %s',
    AD_QUESTS_ZONE = 'Achever la quête "%s" dans %s.',
    AD_QUESTS_ZONE_MULTI = 'Achever les suites de quêtes dans %s listées ci-dessous.',
    AC_QUESTS_ZONE = '%s',
	
	-- Kalimdor sub-category
    AN_WISDOM_KEEPER_KALIMDOR = 'Maître des traditions de Kalimdor',
    AD_WISDOM_KEEPER_KALIMDOR = 'Accomplir les hauts faits de quêtes de Kalimdor listés ci-dessous. ',
	
	AZSHARA_1 = 'Azshara',
    AZSHARA_2 = 'Azshara',
    QUEST_3602 = 'Azsharite',
	
	BARRENS_1 = 'Les Tarides (the Barrens)',
    BARRENS_2 = 'Les Tarides (the Barrens)',
    QUEST_888 = 'Course à la lentille',
    QUEST_902 = 'Samophlange',
	
	DESOLACE_1 = 'Désolace',
    DESOLACE_2 = 'Désolace',
    QUEST_6027 = 'Le Livre des Anciens',
	
	DUROTAR_1 = 'Durotar',
    DUROTAR_2 = 'Durotar',
    QUEST_835 = 'Des lignes sécurisées',
	
	DUSTWALLOW_1 = 'Marécage d\'Âprefange (Dustwallow Marsh)',
    DUSTWALLOW_2 = 'Marécage d\'Âprefange (Dustwallow Marsh)',
    QUEST_1203 = 'Jarl a besoin d\'une épée',
	
	FELWOOD_1 = 'Gangrebois (Felwood)',
    FELWOOD_2 = 'Gangrebois (Felwood)',
    QUEST_5165 = 'En calmant les flammes de protection',
    QUEST_5385 = 'Les restes de Trey Lightforge',
	
	SILITHUS_1 = 'Silithus',
    SILITHUS_2 = 'Silithus',
    QUEST_8287 = 'Un terrible but',
    QUEST_8352 = 'Le sceptre du Conseil',
    QUEST_8321 = 'Vyral le Vil',
    QUEST_8281 = 'Améliorer la sécurité',
	
	STONETALON_1 = 'Les Serres-Rocheuses (Stonetalon Mts)',
    STONETALON_2 = 'Les Serres-Rocheuses (Stonetalon Mts)',
    QUEST_1096 = 'Gerenzo Wrenchwhistle',
	
	TANARIS_1 = 'Tanaris',
    TANARIS_2 = 'Tanaris',
    QUEST_2662 = 'Elixir Noggenfogger',
    QUEST_2874 = 'Livraison à MacKinley',
    QUEST_1691 = 'Continuer à châtier les Bat-le-désert',
    QUEST_113 = 'Analyse des morceaux d\'insectes',
	
	THOUSAND_NEEDLES_1 = 'Mille pointes (Thousand Needles)',
    THOUSAND_NEEDLES_2 = 'Mille pointes (Thousand Needles)',
    QUEST_1189 = 'La sécurité d\'abord',

	UNGORO_1 = 'Cratère d\'Un\'Goro',
    UNGORO_2 = 'Cratère d\'Un\'Goro',
    QUEST_3962 = 'C\'est dangereux d\'y aller seul',
    QUEST_4245 = 'À la poursuite d\'A-mi 01',
    QUEST_4292 = 'Un appât pour Lar\'korwi',

	WINTERSPRING_1 = 'Berceau-de-l\'Hiver (Winterspring)',
    WINTERSPRING_2 = 'Berceau-de-l\'Hiver (Winterspring)',
    QUEST_975 = 'Cache de Mau\'ari',
    QUEST_5082 = 'La menace des Tombe-hiver',
    QUEST_5121 = 'Le grand chef Tombe-hiver',
    QUEST_5163 = 'Yéti ? Y es-tu ?',
    QUEST_4842 = 'Sources étranges',
	
	-- Eastern Kingdoms sub-category
    AN_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Maître des traditions des royaumes de l\'Est',
    AD_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Accomplir les hauts faits de quêtes des royaumes de l\'Est listés ci-dessous.',

    ARATHI_1 = 'Hautes-terres d\'Arathi',
    ARATHI_2 = 'Hautes-terres d\'Arathi',
    QUEST_652 = 'La Pierre cruciale',

    BADLANDS_1 = 'Terres ingrates (Badlands)',
    BADLANDS_2 = 'Terres ingrates (Badlands)',
    QUEST_737 = 'Le savoir perdu',
    QUEST_778 = 'Ça promet d\'être dur',
    QUEST_656 = 'L\'invocation de la Princesse',
	
	BLACK_ROCK_1 = 'Mont Blackrock',
    BLACK_ROCK_2 = 'Mont Blackrock',
    QUEST_8996 = 'Retourner voir Bodley',
	
	BLASTED_LANDS_1 = 'Terres foudroyées (Blasted Lands)',
    BLASTED_LANDS_2 = 'Terres foudroyées (Blasted Lands)',
    QUEST_3628 = 'Vous êtes Rakh\'likh, démon',
    
    EASTERN_PLAGUELANDS_1 = 'Maleterres de l\'est (Eastern Plaguelands)',
    EASTERN_PLAGUELANDS_2 = 'Maleterres de l\'est (Eastern Plaguelands)',
    QUEST_5942 = 'Trésors cachés',
    QUEST_6041 = 'Quand Smokey chante, je deviens violent',
    QUEST_5265 = 'Siège de l\'Aube d\'argent',
	
	SEARING_GORGE_1 = 'Gorge des Vents brûlants (Searing Gorge)',
    SEARING_GORGE_2 = 'Gorge des Vents brûlants (Searing Gorge)',
    QUEST_3481 = 'Bibelots...',    

    STRANGLETHORN_VALLEY_1 = 'Vallée de Strangleronce (Stranglethorn Vale)',
    STRANGLETHORN_VALLEY_2 = 'Vallée de Strangleronce (Stranglethorn Vale)',
    QUEST_208 = 'La chasse au gros gibier',
    QUEST_600 = 'La mauvaise mine de la KapitalRisk',
    QUEST_613 = 'Le pied-bot de Maury',
    QUEST_628 = 'L\'Excelsior de chez Drizzlik',
    QUEST_338 = 'Les vertes collines de Strangleronce',

    WESTERN_PLAGUELANDS_1 = 'Maleterres de l\'ouest (Western Plaguelands)',
    WESTERN_PLAGUELANDS_2 = 'Maleterres de l\'ouest (Western Plaguelands)',
    QUEST_5944 = 'En rêves',
    QUEST_5051 = 'Deux moitiés deviennent Une',
    QUEST_4985 = 'La faune et la flore en souffrent aussi',

	-- ################
	-- PvE achievements
	-- ################
    -- Main category
	AN_DEFENDER = 'Maître des donjons',
    AD_DEFENDER = 'Accomplir les hauts faits dans les donjons listés ci-dessous.',
    AR_DEFENDER = 'Titre factice : défenseur d\'Azeroth.',
	
	AN_BLACKROCK_MASTER = 'Seigneur du Mont Blackrock',
    AD_BLACKROCK_MASTER = 'Accomplir les hauts faits dans les donjons et raids du Mont Blackrock listés ci-dessous.',
    
	AN_HERO = 'Écumeur des raids',
    AD_HERO = 'Accomplir les hauts faits dans les raids listés ci-dessous.',
    AR_HERO = 'Titre factice : héro d\'Azeroth.',
    
	AN_GREAT_HERO = 'Grand héro d\'Azeroth',
    AD_GREAT_HERO = 'Accomplir les hauts faits dans les donjons et raids listés ci-dessous.',
    AR_GREAT_HERO = 'Titre factice : grand héro d\'Azeroth.',
	
	-- Dungeons sub-category
	AN_RAGEFIRE_CHASM = 'Gouffre de Ragefeu',
    AD_RAGEFIRE_CHASM = 'Vaincre Bazzalan.',
	
	AN_WAILING_CAVERNS = 'Cavernes des Lamentations',
    AD_WAILING_CAVERNS = 'Vaincre Mutanus le Dévoreur.',
	
	AN_DEAD_MINES = 'Mortemines',
    AD_DEAD_MINES = 'Vaincre Edwin VanCleef.',
	
	AN_SHADOWFANG_KEEP = 'Donjon d\'Ombrecroc',
    AD_SHADOWFANG_KEEP = 'Vaincre l\'archimage Arugal.',
	
	AN_JAIL = 'Prison de Hurlevent',
    AD_JAIL = 'Vaincre Kam Deepfury.',
	
	AN_BLACKFATHOM_DEEPS = 'Profondeurs de Brassenoire',
    AD_BLACKFATHOM_DEEPS = 'Vaincre Aku\'mai.',    
	
    AN_GNOMREGAN = 'Gnomeregan',
    AD_GNOMREGAN = 'Vaincre le mekgénieur Thermojoncteur.',
	
	AN_RAZORFEN_KRAUL = 'Kraal de Tranchebauge',
    AD_RAZORFEN_KRAUL = 'Vaincre Charlga Trancheflanc.',
	
	AN_SCARLET_MONASTERY = 'Monastère écarlate',
    AD_SCARLET_MONASTERY = 'Vaincre la Croisade écarlate au Monastère écarlate.',
    AC_SCARLET_MONASTERY1 = 'Mage de sang Thalnos',
    AC_SCARLET_MONASTERY2 = 'Arcaniste Doan',
    AC_SCARLET_MONASTERY3 = 'Hérode',
    AC_SCARLET_MONASTERY4 = 'Grande inquisitrice Blanchetête',    
	
    AN_RAZORFEN_DOWNS = 'Souilles de Tranchebauge',
    AD_RAZORFEN_DOWNS = 'Vaincre les boss dans les souilles de Tranchebauge.',
    AC_RAZORFEN_DOWNS1 = 'Amnennar le Porte-froid',
    AC_RAZORFEN_DOWNS2 = 'Pestegueule le Pourrissant',
	
	AN_ULDAMAN = 'Uldaman',
    AD_ULDAMAN = 'Vaincre Archaedas.',
	
	AN_ZULFARRAK = 'Zul\'Farrak',
    AD_ZULFARRAK = 'Vaincre le chef Ukorz Scalpessable.',
	
	AN_MARAUDON = 'Maraudon',
    AD_MARAUDON = 'Vaincre la princesse Theradras.',
	
	AN_SUNKEN_TEMPLE = 'Temple englouti',
    AD_SUNKEN_TEMPLE = 'Vaincre l\'Ombre d\'Eranikus.',
	
	AN_NEW_EMPEROR = 'Nouvel empereur',
    AD_NEW_EMPEROR = 'Vaincre l\'empereur Dagran Thaurissan.',
    AN_BLACKROCK_DEPTHS = 'Nettoyer les profondeurs',
    AD_BLACKROCK_DEPTHS = 'Vaincre les boss dans les profondeurs de Blackrock.',
    AC_BLACKROCK_DEPTHS1 = 'Grand Interrogateur Gerstahn',
    AC_BLACKROCK_DEPTHS2 = 'Maître-chien Grebmar',
    AC_BLACKROCK_DEPTHS3 = 'Général Forgehargne',
    AC_BLACKROCK_DEPTHS4 = 'Seigneur golem Argelmach',
    AC_BLACKROCK_DEPTHS5 = 'Seigneur Incendius',
    AC_BLACKROCK_DEPTHS6 = 'Gardien Stilgiss',
    AC_BLACKROCK_DEPTHS7 = 'Bael\'Gar',
    AN_BLACKROCK_PARTY = 'Fête dans les profondeurs',
    AD_BLACKROCK_PARTY = 'Vaincre les boss de l\'Auberge dans les profondeurs de Blackrock.',
    AC_BLACKROCK_PARTY1 = 'Ribbly Screwspigot',
    AC_BLACKROCK_PARTY2 = 'Plugger Spazzring',
    AC_BLACKROCK_PARTY3 = 'Hurley Blackbreath',
    AC_BLACKROCK_PARTY4 = 'Phalange',
    AN_BLACKROCK_DEPTHS_FULL = 'Profondeurs de Blackrock',
    AD_BLACKROCK_DEPTHS_FULL = 'Accomplir les hauts faits dans les profondeurs de Blackrock listés ci-dessous.',
    AN_ARMOR_SWORD = 'La meilleur défense c\'est l\'attaque',
    AD_ARMOR_SWORD = 'Obtenir la pierre de la Terre sur Panzor l\'Invincible dans les profondeurs de Blackrock.',
	
	AN_BLACKROCK_SPIRE_BOTTOM = 'Bas du pic Blackrock',
    AD_BLACKROCK_SPIRE_BOTTOM = 'Vaincre le seigneur Wyrmthalak.',
    AN_BLACKROCK_SPIRE_UPPER = 'Sommet du pic Blackrock',
    AD_BLACKROCK_SPIRE_UPPER = 'Vaincre le général Drakkisath.',
    AN_BLACKROCK_SPIRE = 'Envahisseur du pic Blackrock',
    AD_BLACKROCK_SPIRE = 'Accomplir les hauts faits dans le pic Blackrock listés ci-dessous.',
	AN_LEEROY = 'Leeeeeeeeeeeeeroy !',
	AD_LEEROY = 'Tuer 50 dragonnets de la colonie en 15 secondes.',
	AR_LEEROY = 'Titre factice : Jenkins.',
	
	AN_SCHOLOMANCE = 'Scholomance',
    AD_SCHOLOMANCE = 'Vaincre le Sombre Maître Gandling.',
	
	AN_STRATHOLME_LIVE = 'Quartier des vivants de Stratholme',
    AD_STRATHOLME_LIVE = 'Vaincre Balnazzar.',
    AN_STRATHOLME_DEAD = 'Quartier des morts-vivants de Stratholme',
    AD_STRATHOLME_DEAD = 'Vaincre le Baron Rivendare',
    AN_STRATHOLME = 'Stratholme',
    AD_STRATHOLME = 'Triompher des pièges maléfiques qui hantent Stratholme.',
	
	AN_DIRE_MAUL = 'Le roi de Hache-tripes',
    AD_DIRE_MAUL = 'Triompher de chaque aile de Hache-tripes.',
    AC_DIRE_MAUL1 = 'Alzzin le Modeleur',
    AC_DIRE_MAUL2 = 'Prince Tortheldrin',
    AC_DIRE_MAUL3 = 'Roi Gordok',

    AN_YOUNG_DEFENDER = 'Jeune défenseur d\'Azeroth',
    AD_YOUNG_DEFENDER = 'Accomplir les hauts faits dans les donjons listés ci-dessous.',
    
	-- Raids sub-category
	AN_RAGNAROS = 'Cœur du Magma',
    AD_RAGNAROS = 'Vaincre Ragnaros.',
	
    AN_ONYXIA = 'Le repaire d\'Onyxia',
    AD_ONYXIA = 'Vaincre Onyxia.',

	AN_BLACK_WING_LAIR = 'Repaire de l\'Aile noire',
    AD_BLACK_WING_LAIR = 'Vaincre Nefarian.',
	AN_BWL_DUO = 'Double respiration',
	AD_BWL_DUO = 'Vaincre Rochébène et Flamegor en moins de 45 secondes.',
	
	AN_ZULGURUB = 'Zul\'Gurub',
    AD_ZULGURUB = 'Vaincre Hakkar.',
	
    AN_AQ20 = 'Ruines d\'Ahn\'Qiraj',
    AD_AQ20 = 'Vaincre Ossirian l\'Intouché.',
	
	AN_AQ40 = 'Temple d\'Ahn\'Qiraj',
    AD_AQ40 = 'Vaincre C\'thun.',
	
	AN_NAXXRAMAS_SPIDERS = 'Le quartier des Arachnides',
    AD_NAXXRAMAS_SPIDERS = 'Vaincre Maexxna à Naxxramas.',
    AN_NAXXRAMAS_PLAGUE = 'Le quartier de la Peste',
    AD_NAXXRAMAS_PLAGUE = 'Vaincre Horreb à Naxxramas.',
    AN_NAXXRAMAS_MILITARY = 'Le quartier Militaire',
    AD_NAXXRAMAS_MILITARY = 'Vaincre les 4 cavaliers à Naxxramas.',
    AN_NAXXRAMAS_CONSTRUCT = 'Le quartier des Assemblages',
    AD_NAXXRAMAS_CONSTRUCT = 'Vaincre Thaddius à Naxxramas.',
    AN_NAXXRAMAS_LAIR = 'Défaite de Kel\'Thuzad',
    AD_NAXXRAMAS_LAIR = 'Vaincre Kel\'Thuzad à Naxxramas.',
    AN_NAXXRAMAS = 'Vainqueur de Naxxramas',
    AD_NAXXRAMAS = 'Accomplir les hauts faits dans Naxxramas listés ci-dessous.',
	AN_ANUBREKHAN_WITHOUT_MOBS = 'Une mauvaise araignée',
	AD_ANUBREKHAN_WITHOUT_MOBS = 'Vaincre Anub\'Rekhan à Naxxramas en laissant les deux gardes de la crypte en vie.',
	AN_FAERLINA_WITHOUT_MOBS = 'La veuve non solitaire',
	AD_FAERLINA_WITHOUT_MOBS = 'Vaincre la grande veuve Faerlina à Naxxramas en laissant en vie tous les fidèles et adeptes.',
	AN_SAPPHIRONE_WITH_ALL_ALIVE = 'Nous ne nous soumettrons pas à la glace',
	AD_SAPPHIRONE_WITH_ALL_ALIVE = 'Vaincre Saphiron à Naxxramas sans qu\'un seul membre du raid ne meurt.',
	AN_ARACHNOPHOBIA = 'Arachnophobie',
	AD_ARACHNOPHOBIA = 'Tuer Maexxna à Naxxramas dans les 20 minutes qui suivent la mort d\'Anub\'Rekhan.',
	AN_FOUR_TOGETHER = 'Jusqu\'à ce que mort s\'ensuive',
	AD_FOUR_TOGETHER = 'Vaincre les 4 cavaliers à Naxxramas à moins de 15 secondes d\'intervalle les uns des autres.',
	
    AN_YOUNG_HERO = 'Jeune héro d\'Azeroth',
    AD_YOUNG_HERO = 'Accomplir les hauts faits dans les raids listés ci-dessous.',
    
	-- World boss sub-category
	AN_WB_AZUREGOS = 'Le secret du dragon bleu',
    AD_WB_AZUREGOS = 'Vaincre Azuregos.',
	
    AN_WB_KAZZAK = 'Les démons ne passeront pas',
    AD_WB_KAZZAK = 'Vaincre Seigneur Kazzak.',
	
    AN_WB_YSONDRE = 'Pas de place pour les filles dans un cauchemar',
    AD_WB_YSONDRE = 'Vaincre Ysondre.',
	
    AN_WB_LETHON = 'Enfant du Cauchemar d\'émeraude ',
    AD_WB_LETHON = 'Vaincre Lethon.',
	
    AN_WB_EMERISS = 'Emeriss, le traitre à la vie',
    AD_WB_EMERISS = 'Vaincre Emeriss.',
	
    AN_WB_TAERAR = 'Taerar cauchemardesque',
    AD_WB_TAERAR = 'Vaincre Taerar.',
	
    AN_WB_EMERALD_DRAGONS = 'Gardien d\'émeraude',
    AD_WB_EMERALD_DRAGONS = 'Vaincre tous les dragons du Cauchemar d\'émeraude.',
    AR_WB_EMERALD_DRAGONS = 'Titre factice : Gardien d\'émeraude.',
    
	-- ################
	-- PvP achievements
	-- ################
	-- Main category
	AN_PVP_RANK_A1 = 'Soldat',
    AN_PVP_RANK_A2 = 'Caporal',
    AN_PVP_RANK_A3 = 'Sergent',
    AN_PVP_RANK_A4 = 'Sergent-chef',
    AN_PVP_RANK_A5 = 'Sergent-major',
    AN_PVP_RANK_A6 = 'Chevalier',
    AN_PVP_RANK_A7 = 'Chevalier-lieutenant',
    AN_PVP_RANK_A8 = 'Chevalier-capitaine',
    AN_PVP_RANK_A9 = 'Chevalier-champion',
    AN_PVP_RANK_A10 = 'Lieutenant-commandant',
    AN_PVP_RANK_A11 = 'Commandant',
    AN_PVP_RANK_A12 = 'Maréchal',
    AN_PVP_RANK_A13 = 'Grand maréchal',
    AN_PVP_RANK_A14 = 'Connétable',
    AN_PVP_RANK_H1 = 'Éclaireur',
    AN_PVP_RANK_H2 = 'Grunt',
    AN_PVP_RANK_H3 = 'Sergent',
    AN_PVP_RANK_H4 = 'Sergent-chef',
    AN_PVP_RANK_H5 = 'Adjudant',
    AN_PVP_RANK_H6 = 'Garde de pierre',
    AN_PVP_RANK_H7 = 'Garde de sang',
    AN_PVP_RANK_H8 = 'Légionnaire',
    AN_PVP_RANK_H9 = 'Centurion',
    AN_PVP_RANK_H10 = 'Champion',
    AN_PVP_RANK_H11 = 'Lieutenant-général',
    AN_PVP_RANK_H12 = 'Général',
    AN_PVP_RANK_H13 = 'Seigneur de guerre',
    AN_PVP_RANK_H14 = 'Grand seigneur de guerre',
    AD_PVP_RANK = 'Obtenez le rang du même nom que le haut fait.',
    
	AN_PVP_FIRST_KILL = 'Une victoire honorable',
    AD_PVP_FIRST_KILL = 'Obtenir une victoire honorable.',
    AC_PVP_FIRST_KILL = 'A obtenu une victoire honorable.',
    AN_PVP_KILLS = '%d victoires honorables',
    AD_PVP_KILLS = 'Obtenir %d victoires honorables.',
    AC_PVP_KILLS = 'A obtenu %d victoires honorables',
	
	AN_HORDE_PVP_FRACTIONS = 'Conquérant',
    AD_HORDE_PVP_FRACTIONS = 'Être exalté auprès des factions du goulet des Chanteguerres, du bassin d\'Arathi et de la vallée d\'Alterac.',
	AN_ALLIANCE_PVP_FRACTIONS = 'Le justicier',
    AD_ALLIANCE_PVP_FRACTIONS = 'Être exalté auprès des factions du goulet des Chanteguerres, du bassin d\'Arathi et de la vallée d\'Alterac.',
	
	AN_THRALL_SLAYER = 'Mort au chef de guerre !',
    AD_THRALL_SLAYER = 'Tuer Thrall.',	
    AN_VOLJIN_SLAYER = 'Mort au messager des esprits',
    AD_VOLJIN_SLAYER = 'Tuer Vol\'jin.',	
    AN_SYLVANAS_SLAYER = 'À bas la Dame noire',
    AD_SYLVANAS_SLAYER = 'Tuer Dame Sylvanas Coursevent.',	
    AN_CAIRNE_SLAYER = 'Un Sabot-de-sang saignant',
    AD_CAIRNE_SLAYER = 'Tuer Cairne Sabot-de-sang.',
    AN_HORDE_KINGS_SLAYER = 'Pour l\'Alliance !',
    AD_HORDE_KINGS_SLAYER = 'Tuer les chefs de la Horde.',
	
	AN_BOLVAR_SLAYER = 'La prise de Hurlevent',
    AD_BOLVAR_SLAYER = 'Tuer le généralissime Bolvar Fordragon.',
    AN_MAGNI_SLAYER = 'Mort au roi !',
    AD_MAGNI_SLAYER = 'Tuer le roi Magni Barbe-de-bronze.',
    AN_MEKKATORQUE_SLAYER = 'Goblins > Gnomes',
    AD_MEKKATORQUE_SLAYER = 'Tuer le grand bricoleur Mekkatorque.',
    AN_TYRANDE_SLAYER = 'L\'immortalité, c\'est fini',
    AD_TYRANDE_SLAYER = 'Tuer la grande prêtresse Tyrande Murmevent.',
    AN_ALLIANCE_KINGS_SLAYER = 'Pour la Horde !',
    AD_ALLIANCE_KINGS_SLAYER = 'Tuer les chefs de l\'Alliance.',
	
    AN_RACES_KILLER = 'Connais ton ennemi...',
    AD_ALLIANCE_RACES_KILLER = 'Asséner un coup fatal apportant une victoire honorable sur toutes les races de l\’Alliance.',
    AD_HORDE_RACES_KILLER = 'Asséner un coup fatal apportant une victoire honorable sur toutes les races de la Horde.',
    AC_HUMAN_KILLED = 'Humain',
    AC_NIGHTELF_KILLED = 'Elfe de la nuit',
    AC_DWARF_KILLED = 'Nain',
    AC_GNOME_KILLED = 'Gnome',
    AC_ORC_KILLED = 'Orc',
    AC_TROLL_KILLED = 'Troll',
    AC_SCOURGE_KILLED = 'Mort-vivant',
    AC_TAUREN_KILLED = 'Tauren',

    AN_CLASSES_KILLER = 'Ça, c\'est la classe',
    AD_CLASSES_KILLER = 'Asséner un coup fatal apportant une victoire honorable sur un membre de chaque classe.',
    AC_WARRIOR_KILLED = 'Guerrier',
    AC_HUNTER_KILLED = 'Chasseur',
    AC_ROGUE_KILLED = 'Voleur',
    AC_PRIEST_KILLED = 'Prêtre',
    AC_MAGE_KILLED = 'Mage',
    AC_WARLOCK_KILLED = 'Démoniste',
    AC_DRUID_KILLED = 'Druide',
    AC_PALADIN_KILLED = 'Paladin',
    AC_SHAMAN_KILLED = 'Chaman',
	
	AN_BGS_KILLING_BLOWS = 'Porte-mort',
    AD_BGS_KILLING_BLOWS = 'Asséner %d coups fatals au cours d\'un même champ de bataille.',
	
    AN_BGS_KILLS = 'Le Faucheur',
    AD_BGS_KILLS = 'Obtenir %d victoires honorables au cours d\'un même champ de bataille.',
	
	AN_DUEL = 'Duel-icieux',
    AD_DUEL = 'Gagner un duel contre un autre personnage.',
    AN_DUELS_10 = 'Duelliste',
    AN_DUELS_25 = 'Duelliste qualifié',
    AN_DUELS_100 = 'Maître duelliste',
    AD_DUELS = '%d duels gagnés.',
    AC_DUELS = 'A gagné %d duels',
	
	AN_GURUBASHI_1 = 'Maître de l\'arène des Gurubashi',
    AD_GURUBASHI_1 = 'Obtenir le bijou Maître de l\'arène dans l\'arène des Gurubashi.',
	AN_GURUBASHI_2 = 'Grand maître de l\'arène des Gurubashi',
    AD_GURUBASHI_2 = 'Achever la quête de Court John Mithril pour obtenir le bijou Grand maître de l\'arène.',
	
	AN_PARTICIPATE_IN_BGS = 'Appel aux armes !',
    AD_PARTICIPATE_IN_BGS = 'Achever %d champs de bataille au niveau maximum.',
    AC_PARTICIPATE_IN_BGS = 'A achevé %d champs de bataille au niveau maximum',
	
	AN_BATTLEMASTER = 'Maître de guerre',
    AD_BATTLEMASTER = 'Accomplir les hauts faits de champ de bataille listés ci-dessous.',
    AR_BATTLEMASTER = 'Titre factice : Maître de guerre.',
	
	-- Alterac Valley sub-category
	AN_FROSTWOLF_CLAN = 'Héros du clan Loup-de-givre',
    AD_FROSTWOLF_CLAN = 'Être exalté auprès du clan Loup-de-givre.',
	AN_STORMSPIKE_GUARD = 'Héros de la garde Foudrepique',
    AD_STORMSPIKE_GUARD = 'Être exalté auprès de la garde Foudrepique.',
	
	AN_ALTERAC_WIN = 'Victoire dans la vallée d\'Alterac',
    AD_ALTERAC_WIN = 'Gagner dans la vallée d\'Alterac.',
    AN_ALTERAC_WINS = 'Alterac Valley Veteran',
    AD_ALTERAC_WINS = 'A gagné %d victoires dans la vallée d\'Alterac.',
	
	AN_ALTERAC_KILLING_BLOWS = 'Valley Meat Grinder',
    AD_ALTERAC_KILLING_BLOWS = 'Make %d killing blows in a single battle for Alterac Valley and stay to the end of the battle.',
	
	AN_ALTERAC_GRAVEYARD_ASSAULT = 'Undertaker',
    AD_ALTERAC_GRAVEYARD_ASSAULT = 'Assault the graveyard while fighting for Alterac Valley and stay before the battle is over.',
	AN_ALTERAC_GRAVEYARD_ASSAULTS = 'There are never enough coffins',
    AD_ALTERAC_GRAVEYARD_ASSAULTS = 'Assault %d graveyards in a single battle for Alterac Valley and stay to the end of the battle.',
	
	AN_ALTERAC_GRAVEYARD_DEFEND = 'Guardian of the deceased',
    AD_ALTERAC_GRAVEYARD_DEFEND = 'Defend the graveyard while fighting for Alterac Valley and stay before the battle is over.',
    AN_ALTERAC_GRAVEYARD_DEFENDS = 'Guardian of all the dead',
	AD_ALTERAC_GRAVEYARD_DEFENDS = 'Defend %d graveyards in a single battle for Alterac Valley and stay to the end of the battle.',
	
	AN_ALTERAC_TOWER_ASSAULT = 'Now it\'s mine!',
    AD_ALTERAC_TOWER_ASSAULT = 'Assault the tower while fighting for Alterac Valley and stay before the battle is over.',
    AN_ALTERAC_TOWER_ASSAULTS = 'Now it\'s all mine!',
    AD_ALTERAC_TOWER_ASSAULTS = 'Assault %d towers in a single battle for Alterac Valley and stay to the end of the battle.',
	
	AN_ALTERAC_TOWER_DEFEND = 'Tower keeper',
    AD_ALTERAC_TOWER_DEFEND = 'Defend the tower while fighting for Alterac Valley and stay before the battle is over.',
    AN_ALTERAC_TOWER_DEFENDS = 'Towers keeper',
    AD_ALTERAC_TOWER_DEFENDS = 'Defend %d towers in a single battle for Alterac Valley and stay to the end of the battle.',
	
	AN_ALTERAC_MINE_CAPTURE = 'Frozen miner',
    AD_ALTERAC_MINE_CAPTURE = 'Assault the mine while fighting for Alterac Valley and stay before the battle is over.',
    AN_ALTERAC_MINE_CAPTURES = 'Frozen pikeman',
    AD_ALTERAC_MINE_CAPTURES = 'Assault %d mines in a single battle for Alterac Valley and stay to the end of the battle.',
	
	AN_ALTERAC_FAST_WIN = 'The Alterac Blitz',
    AD_ALTERAC_FAST_WIN = 'Win Alterac Valley in under 6 minutes.',
	
	AN_ALTERAC_TOWER_DEFEND_TOTAL = 'Défense des tours',
    AD_ALTERAC_TOWER_DEFEND_TOTAL = 'Défendre %d tours dans la vallée d\’Alterac.',
	
	AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = 'Alterac Grave Robber',
    AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = 'Prendre %d cimetières dans la vallée d\’Alterac.',
	
	AN_ALTERAC_MOUNT_ALLIANCE = 'Destrier de bataille foudrepique',
    AD_ALTERAC_MOUNT_ALLIANCE = 'Obtenir un destrier de bataille foudrepique.',
	
	AN_ALTERAC_BOSS = 'Maîtrise de la vallée d\'Alterac',
    AD_ALTERAC_BOSS = 'Accomplir les hauts faits de la vallée d\'Alterac listés ci-dessous.',
	
	-- Warsong Gulch sub-category
	AN_WARSONG_OUTRIDERS = 'There is only one song',
    AD_WARSONG_OUTRIDERS = 'Reach Exalted with Warsong Outriders.',
	AN_SILVERWING_SENTINELS = 'Silver wings',
    AD_SILVERWING_SENTINELS = 'Reach Exalted with Silverwing Sentinels.',
	
	AN_WARSONG_WIN = 'Victory in the Gulch',
    AD_WARSONG_WIN = 'Win the battle for Warsong Gulch.',
    AN_WARSONG_WINS = 'Warsong Gulch Veteran',
    AD_WARSONG_WINS = 'Win %d battles for Warsong Gulch.',
	
	AN_WARSONG_KILLS = 'Military honor',
    AD_WARSONG_KILLS = 'Get %d honorable kills in a single battle for Warsong Gulch and stay to the end of the battle.',
	
    AN_WARSONG_FLAG_CAPTURE = 'Flag bearer',
    AD_WARSONG_FLAG_CAPTURE = 'Capture enemies flag while fighting for Warsong Gulch and stay before the battle is over.',
    AN_WARSONG_FLAG_CAPTURES = 'Great flag bearer',
    AD_WARSONG_FLAG_CAPTURES = 'Capture enemies flag %d times in a single battle for Warsong Gulch and stay to the end of the battle.',
	
    AN_WARSONG_FLAG_RETURN = 'Don\'t touch!',
    AD_WARSONG_FLAG_RETURN = 'Return your fraction flag to the base while fighting for Warsong Gulch and stay before the battle is over.',
    AN_WARSONG_FLAG_RETURNS = 'Don\'t touch anything!',
    AD_WARSONG_FLAG_RETURNS = 'Return %d your fraction flags to the base in a single battle for Warsong Gulch and stay to the end of the battle.',
	
	AN_WARSONG_FAST_WIN = 'Warsong Expedience',
    AD_WARSONG_FAST_WIN = 'Win Warsong Gulch in under 7 minutes.',
	
	AN_WARSONG_FLAG_CAPTURE_TOTAL = 'Flags Capturer',
    AD_WARSONG_FLAG_CAPTURE_TOTAL = 'Personally carry and capture %d flags in Warsong Gulch.',
	
    AN_WARSONG_FLAG_RETURN_TOTAL = 'Persistent Defender',
    AD_WARSONG_FLAG_RETURN_TOTAL = 'Return %d flags as a defender in Warsong Gulch.',
	
	AN_WARSONG_BOSS = 'Master of Warsong Gulch',
    AD_WARSONG_BOSS = 'Complete the Warsong Gulch achievements listed below.',
	
	-- Arathi Basin
	AN_DEFILERS = 'For the Defilers!',
    AD_DEFILERS = 'Reach Exalted with Defilers.',
	AN_LEAGUE_OF_ARATHOR = 'For Arathor!',
    AD_LEAGUE_OF_ARATHOR = 'Reach Exalted with the League of Arathor.',
	
	AN_ARATHI_WIN = 'Victory in the Basin',
    AD_ARATHI_WIN = 'Win the battle for Arathi Basin.',
    AN_ARATHI_WINS = 'Arathi Basin Veteran',
    AD_ARATHI_WINS = 'Win %d battles for Arathi Basin.',
	
	AN_ARATHI_BASE_ASSAULT = 'Conquistador',
    AD_ARATHI_BASE_ASSAULT = 'Assault a construction while fighting for Arathi Basin and stay before the battle is over.',
	AN_ARATHI_BASE_ASSAULTS = 'The famous conquistador',
    AD_ARATHI_BASE_ASSAULTS = 'Assault %d constructions in a single battle for Arathi Basin and stay to the end of the battle.',
	
	AN_ARATHI_BASE_DEFEND = 'Sentry',
    AD_ARATHI_BASE_DEFEND = 'Defend a construction while fighting for Arathi Basin and stay before the battle is over.',
    AN_ARATHI_BASE_DEFENDS = 'Honorary sentry',
    AD_ARATHI_BASE_DEFENDS = 'Defend %d constructions in a single battle for Arathi Basin and stay to the end of the battle.',
	
	AN_ARATHI_CATS = 'Cats first, then everything else',
    AD_ARATHI_CATS = '/pat the designated felines in Arathi Basin.',
	
	AN_ARATHI_FAST_WIN = 'Let\'s Get This Done',
    AD_ARATHI_FAST_WIN = 'Win Arathi Basin in under 6 minutes.',
	
	AN_ARATHI_BASE_ASSAULT_TOTAL = 'Me and the Cappin\' Makin\' it Happen',
    AD_ARATHI_BASE_ASSAULT_TOTAL = 'Take %d flags in Arathi Basin.',
	
    AN_ARATHI_BASE_DEFEND_TOTAL = 'To The Rescue!',
    AD_ARATHI_BASE_DEFEND_TOTAL = 'Come the the defense of a base in Arathi Basin %d times by recapping the flag.',   
	
    AN_ARATHI_BOSS = 'Master of Arathi Basin',
    AD_ARATHI_BOSS = 'Complete the Arathi Basin achievements listed below.',
	
	-- ########################
	-- Professions achievements
	-- ########################
	-- Main category	
	PROF_FIRST_AID = 'Secourisme',
    PROF_FISHING = 'Pêche',
    PROF_COOKING = 'Cuisine',
    PROF_ENCHANTING = 'Enchantement',
    PROF_TAILORING = 'Couture',
    PROF_ENGINEERING = 'Ingénierie',
    PROF_LEATHERWORKING = 'Travail du cuir',
    PROF_ALCHEMY = 'Alchimie',
    PROF_BLACKSMITHING = 'Forge',
    PROF_HERBALISM = 'Herboristerie',
    PROF_MINING = 'Minage',
    PROF_SKINNING = 'Dépeçage',
    PROF_JEWELCRAFTING = 'Joaillerie',
	
	AN_PROFS_SECONDARY = 'Boulots alimentaires',
    AD_PROFS_SECONDARY = 'Obtenir 300 points de compétence en pêche, secourisme et cuisine.',
	
    AN_PROFS_FIVE = 'Le génie est brillant dans tout',
    AD_PROFS_FIVE = 'Accomplir les hauts faits de métier listés ci-dessous.',
	
	AN_PROFS_JOURNEYMAN = 'Compagnon de métier',
    AD_PROFS_JOURNEYMAN = 'Obtenir 75 points de compétence dans un métier.',
    AN_PROFS_EXPERT = 'Expert de métier',
    AD_PROFS_EXPERT = 'Obtenir 150 points de compétence dans un métier.',
    AN_PROFS_ARTISAN = 'Artisan de métier',
    AD_PROFS_ARTISAN = 'Obtenir 225 points de compétence dans un métier.',
    AN_PROFS_ONE = 'Maître de métier',
    AD_PROFS_ONE = 'Obtenir 300 points de compétence dans un métier.',
    AN_PROFS_TWO = 'Bourreau de travail',
    AD_PROFS_TWO = 'Obtenir 300 points de compétence dans deux métiers.',
    AC_PROFS_TWO = 'A obtenu 300 points de compétence dans deux métiers.',
	
	-- Cooking sub-category
	AN_COOKING_JOURNEYMAN = 'Compagnon cuisinier',
    AD_COOKING_JOURNEYMAN = 'Obtenir 75 points de compétence en cuisine.',
    AN_COOKING_EXPERT = 'Expert cuisinier',
    AD_COOKING_EXPERT = 'Obtenir 150 points de compétence en cuisine.',
    AN_COOKING_ARTISAN = 'Artisan cuisinier',
    AD_COOKING_ARTISAN = 'Obtenir 225 points de compétence en cuisine.',
    AN_COOKING_MASTER = 'Maître cuisinier',
    AD_COOKING_MASTER = 'Obtenir 300 points de compétence en cuisine.',
	
	AN_COOKING_RECIPES_30 = 'Commis',
    AN_COOKING_RECIPES_50 = 'Cuistot',
    AN_COOKING_RECIPES_60 = 'Chef de partie',
    AN_COOKING_RECIPES_70 = 'Sous chef',
    AN_COOKING_RECIPES_80 = 'Chef de cuisine',
    AR_COOKING_RECIPES = 'Titre factice : Chef',
    AD_COOKING_RECIPES = 'Apprendre %d recettes de cuisine.',
    AC_COOKING_RECIPES = 'A appris %d recettes de cuisine.',
	
	AD_COOKING_CREATE = 'Préparer %s %d fois.',
    AC_COOKING_CREATE = 'A préparé %d fois.',

	AN_COOKING_SOUP = 'Brasseur de soupe',	
    AN_COOKING_DESSERT = 'Pâtissier',	
    AN_COOKING_SQUID = 'Fruits de mer sur la table aujourd\'hui',	
    AN_COOKING_DUMPLINGS = 'Boulettes de grand-mère',
	AN_COOKING_CHOPS = 'Côtelettes super nutritives',
	
	AN_COOKING_BIG_TABLE = 'Gloire au chef',
    AD_COOKING_BIG_TABLE = 'Accomplir les hauts faits de cuisine listés ci-dessous.',
	
	-- Fishing sub-category
	AN_FISHING_JOURNEYMAN = 'Compagnon pêcheur',
    AD_FISHING_JOURNEYMAN = 'Obtenir 75 points de compétence en pêche.',
    AN_FISHING_EXPERT = 'Expert pêcheur',
    AD_FISHING_EXPERT = 'Obtenir 150 points de compétence en pêche.',
    AN_FISHING_ARTISAN = 'Artisan pêcheur',
    AD_FISHING_ARTISAN = 'Obtenir 225 points de compétence en pêche.',
    AN_FISHING_MASTER = 'Maître pêcheur',
    AD_FISHING_MASTER = 'Obtenir 300 points de compétence en pêche.',
	
	AN_FISHING_ROD = 'Je choisis le meilleur pour la pêche',
    AD_FISHING_ROD = 'Gagner le concours de pêche de Baie-du-Butin et choisir la canne à pêche en arcanite comme récompense.',
	
    AN_FISHING_TRINKET = 'Véritable amateur de poisson',
    AD_FISHING_TRINKET = 'Gagner le concours de pêche de Baie-du-Butin et choisir le hameçon du maître pêcheur comme récompense.',

    AN_FISHING_COLLECTION = 'Collection de poissons',
    AD_FISHING_COLLECTION = 'Pêcher les poissons listés ci-dessous.',
	
    AN_FISHING_WATER = 'L\'eau de l\'eau',
    AD_FISHING_WATER = 'Pêcher une essence d\'eau.',
	
    AN_FISHING_RUM = 'Je n\'abandonne pas',
    AD_FISHING_RUM = 'Pêcher les rhums listés ci-dessous.',
	AC_FISHING_RUM_BLACK = 'Rhum de Rumsey label noir',
    AC_FISHING_RUM_WHITE = 'Rhum doux de Rumsey',
	
    AN_FISHING_RING = 'Don du Mordor',
    AD_FISHING_RING = 'Pêcher l\'anneau unique.',
	
    AN_FISHING_SKULL = 'Messager d\'une fin triste',
    AD_FISHING_SKULL = 'Pêcher le crâne du vieux Teamster.',
	
    AN_FISHING_SNAPPER = 'Roi du lutjan',
    AD_FISHING_SNAPPER = 'Pêcher les lutjans listés ci-dessous.',
    AC_FISHING_SNAPPER = 'Lutjan de %d livres',
	
    AN_FISHING_SEA_BASS = 'Tempête de mérou',
    AD_FISHING_SEA_BASS = 'Pêcher les mérous listés ci-dessous.',
    AC_FISHING_SEA_BASS = '%d livres',
	
    AN_FISHING_SALMON = 'Amoureux de saumon',
    AD_FISHING_SALMON = 'Pêcher les saumons listés ci-dessous.',
    AC_FISHING_SALMON = '%d',
	
    AN_FISHING_LOBSTER = 'Chasseur de homard',
    AD_FISHING_LOBSTER = 'Pêcher les homards listés ci-dessous.',
    AC_FISHING_LOBSTER = '%d',
	
    AN_FISHING_BIG_SIZE = 'Pêcheur accompli',
    AD_FISHING_BIG_SIZE = 'Accomplir les hauts faits de pêche listés ci-dessous.',
    AR_FISHING_BIG_SIZE = 'Titre factice : Loup de mer.',
	
	-- First Aid sub-category
	AN_FIRST_AID_JOURNEYMAN = 'Compagnon secouriste',
    AD_FIRST_AID_JOURNEYMAN = 'Obtenir 75 points de compétence en secourisme.',
    AN_FIRST_AID_EXPERT = 'Expert secouriste',
    AD_FIRST_AID_EXPERT = 'Obtenir 150 points de compétence en secourisme.',
    AN_FIRST_AID_ARTISAN = 'Artisan secouriste',
    AD_FIRST_AID_ARTISAN = 'Obtenir 225 points de compétence en secourisme.',
    AN_FIRST_AID_MASTER = 'Maître secouriste',
    AD_FIRST_AID_MASTER = 'Obtenir 300 points de compétence en secourisme.',
	
	AN_STOCKING_UP = 'Alimenter',
    AD_STOCKING_UP = 'Créer 100 bandages épais en étoffe runique.',
    AC_STOCKING_UP = 'A créé 100 bandages épais en étoffe runique.',
    AN_STOCKING_UP_2 = 'Alimenter la spéculation',
    AD_STOCKING_UP_2 = 'Créer 500 bandages épais en étoffe runique.',
    AC_STOCKING_UP_2 = 'A créé 500 bandages épais en étoffe runique.',
	
	-- ########################
	-- Reputations achievements
	-- ########################
	-- Main category	
    AN_REPS_1 = 'Quelqu\'un m\'aime',
    AD_REPS_1 = 'Monter une réputation jusqu\'à Exalté.',
    AC_REPS_1 = 'A monté une réputation jusqu\'à Exalté.',
    AN_REPS_2 = 'Deux cours',
    AN_REPS_3 = 'Chéri',
    AN_REPS_4 = 'Adoré',
    AN_REPS_5 = 'Exalté',
    AN_REPS_6 = 'Vénérable',
    AN_REPS_7 = 'Hautement estimée',
    AD_REPS = 'Monter %d réputation jusqu\'à Exalté.',
    AC_REPS = 'A monté %d réputation jusqu\'à Exalté.',
    AR_REPS = 'Titre factice : l\'exalté.',

    AN_HORDE_REPS = 'Ambassadeur de la Horde',
    AD_HORDE_REPS = 'Être exalté auprès des 4 races de sa faction.',
    AC_HORDE_REPS_1 = 'Exalté auprès d’Orgrimmar.',
    AC_HORDE_REPS_2 = 'Exalté auprès des Trolls Darkspear.',
    AC_HORDE_REPS_3 = 'Exalté auprès d\'Undercity.',
    AC_HORDE_REPS_4 = 'Exalté auprès de Thunder Bluff.',
    AN_ALLIANCE_REPS = 'Ambassadeur de l\'Alliance',
    AD_ALLIANCE_REPS = 'Être exalté auprès des 4 races de sa faction.',
    AC_ALLIANCE_REPS_1 = 'Exalté auprès de Stormwind.',
    AC_ALLIANCE_REPS_2 = 'Exalté auprès de Darnassus.',
    AC_ALLIANCE_REPS_3 = 'Exalté auprès des Exilés de Gnomeregan.',
    AC_ALLIANCE_REPS_4 = 'Exalté auprès d\'Ironforge.',
	
	AN_HYDRAXIANS = 'Les Hydraxiens',
    AD_HYDRAXIANS = 'Être exalté auprès des Hydraxiens.',
	
	AN_ZANDALAR_TRIBE = 'Héros de la tribu Zandalar',
    AD_ZANDALAR_TRIBE = 'Être exalté auprès de la tribu Zandalar.',
	
	AN_CENARION_CIRCLE = 'Gardien de Cénarius',
    AD_CENARION_CIRCLE = 'Être exalté auprès du Cercle cénarien.',
	
	AN_BROOD_OF_NOZDORMU = 'Progéniture de Nozdormu',
    AD_BROOD_OF_NOZDORMU = 'Être exalté auprès de la Progéniture de Nozdormu.',

    AN_ARGENT_DAWN = 'L\'Aube d\'argent',
    AD_ARGENT_DAWN = 'Être exalté auprès de l\'Aube d\'argent.',
	
	AN_TIMBERMAW_HOLD = 'Il y a de l\'amour dans ce tunnel',
    AD_TIMBERMAW_HOLD = 'Être exalté auprès des Grumegueules.',   
    
    AN_DARKMOON_FAIRE = 'Sombrelune complète',
    AD_DARKMOON_FAIRE = 'Être exalté auprès de la foire de Sombrelune.',    
    
    AN_PIRATES = 'Yar-r-r !',
    AD_PIRATES = 'Être honoré auprès de la Voile sanglante.',
	
    AN_SHENDRALAR = 'Vous ai-je dit ce qu\'est la folie ?',
    AD_SHENDRALAR = 'Être exalté auprès des Shen\'dralar.',
	
	-- ##############################
	-- World Exploration achievements
	-- ##############################
	-- Main category
	AN_EXPLORE_AZEROTH = 'Explorateur d\'Azeroth',
    AD_EXPLORE_AZEROTH = 'Explorer les Royaumes de l\'est et Kalimdor.',
    
    AN_EXPLORE_KALIMDOR = 'Exploration de Kalimdor',
    AD_EXPLORE_KALIMDOR = 'Explorer les régions de Kalimdor.',
    
    AN_EXPLORE_EASTERN_KINGDOMS = 'Exploration des Royaumes de l\'est',
    AD_EXPLORE_EASTERN_KINGDOMS = 'Explorer les régions des Royaumes de l\'est.',
    
    AN_LOVE = 'À tous les écureuils que j\'ai aimés, avant',
    AD_LOVE = 'Montrer tout votre /amour aux bestioles d\'Azeroth.',
    EMOTE_LOVE1 = 'Vous aimez %s.',    
    EMOTE_PAT1 = 'Vous donnez une tape dans le dos de %s.',
    EMOTE_PAT2 = 'Vous donnez une tape dans le dos d\'%s.',
    NPC_3444 = 'Rat fouisseur',
    NPC_620 = 'Poulet',
    NPC_1420 = 'Crapaud',
    NPC_13321 = 'Grenouille',
    NPC_2620 = 'Chien de prairie',
    NPC_9600 = 'Perroquet',
    NPC_5951 = 'Lièvre',
    NPC_9699 = 'Hanneton de feu',
    NPC_4953 = 'Mocassin d\'eau',
    NPC_721 = 'Lapin',
    NPC_9700 = 'Crabe de lave',
    NPC_15476 = 'Scorpion',
    NPC_2914 = 'Serpent',
    NPC_16030 = 'Asticot',
    NPC_4075 = 'Rat',
    NPC_1412 = 'Ecureuil',
    NPC_7390 = 'Cockatiel',
    NPC_15475 = 'Hanneton',
    NPC_15010 = 'Crapaud de la jungle',
    NPC_4076 = 'Blatte',
    NPC_13016 = 'Rat des profondeurs',
    NPC_14881 = 'Araignée',
    NPC_2110 = 'Rat noir',
    NPC_4166 = 'Gazelle',
    NPC_1933 = 'Mouton',
    NPC_890 = 'Faon',
    NPC_2098 = 'Bélier',
    NPC_2442 = 'Vache',
    NPC_6368 = 'Chat',
    NPC_10582 = 'Chien',
    NPC_385 = 'Cheval',
    NPC_10685 = 'Pourceau',
    NPC_3300 = 'Vipère',
    NPC_15066 = 'Cléo',
    NPC_15071 = 'Casse-pieds',
    
    -- For all explore achievements
    AD_EXPLORE = 'Explorer %s.',
	
	
	-- ##############################
	-- Feats of Strenght achievements
	-- ##############################
	-- Main category
	AN_SULFURAS = 'Sulfuras, Main de Ragnaros',
    AD_SULFURAS = 'S\'équiper de Sulfuras, Main de Ragnaros.',
	
    AN_THUNDER_FURY = 'Lame-tonnerre, épée bénie du Cherchevent',
    AD_THUNDER_FURY = 'S\'équiper de la Lame-tonnerre, épée bénie du Cherchevent.',
	
    AN_ATIESH = 'Atiesh, grand bâton du Gardien',
    AD_ATIESH = 'S\'équiper d\'Atiesh, grand bâton du Gardien.',
	
    AN_BLACK_SCARAB = 'Seigneur Scarabée',
    AD_BLACK_SCARAB = 'Obtenir un cristal de résonance qiraji noir.',
	
    AN_RED_SCARAB = 'Pourquoi ? Parce que !!!',
    AD_RED_SCARAB = 'Obtenir un cristal de résonance qiraji rouge.',

    AN_THANKS = 'Je suis moi-même, tu sais, un développeur',
    AD_THANKS = 'A été particulièrement utile pour développer, tester, traduire ou promouvoir Classic Achievements.',
    AR_THANKS = 'Une gratitude infinie :)',

    AN_RIDING_75 = 'En selle !',
    AD_RIDING_75 = 'Apprendre la compétence Apprenti cavalier.',
    AN_RIDING_150 = 'L\'équipée sauvage',
    AD_RIDING_150 = 'Apprendre la compétence Compagnon cavalier.',
    AN_RIDING_225 = 'La charge héroïque',
    AD_RIDING_225 = 'Apprendre la compétence Expert cavalier.',
    AN_RIDING_300 = 'Les fous du volant',
    AD_RIDING_300 = 'Apprendre la compétence Maître cavalier.'
})
