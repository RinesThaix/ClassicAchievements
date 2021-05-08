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
    AD_UNARMED_SKILL = 'Obtenir un score de 375 avec la compétence Mains nues.',
	SKILL_UNARMED = 'Unarmed',
	
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
    AN_PVP_RANK = 'PvP Rank %d',
    AD_PVP_RANK1 = 'Get the rank of Private (for alliance) or Scout (for the horde).',
    AD_PVP_RANK2 = 'Get the rank of Corporal (for alliance) or Grunt (for the horde).',
    AD_PVP_RANK3 = 'Get the rank of Sergeant.',
    AD_PVP_RANK4 = 'Get the rank of Master Sergeant (for alliance) or Senior Sergeant (for the horde).',
    AD_PVP_RANK5 = 'Get the rank of Sergeant Major (for alliance) or First Sergeant (for the horde).',
    AD_PVP_RANK6 = 'Get the rank of Knight (for alliance) or Stone Guard (for the horde).',
    AD_PVP_RANK7 = 'Get the rank of Knight-Lieutenant (for alliance) or Blood Guard (for the horde).',
    AD_PVP_RANK8 = 'Get the rank of Knight-Captain (for alliance) or Legionnaire (for the horde).',
    AD_PVP_RANK9 = 'Get the rank of Knight-Champion (for alliance) or Centurion (for the horde).',
    AD_PVP_RANK10 = 'Get the rank of Lieutenant Commander (for alliance) or Champion (for the horde).',
    AD_PVP_RANK11 = 'Get the rank of Commander (for alliance) or Lieutenant General (for the horde).',
    AD_PVP_RANK12 = 'Get the rank of Marshal (for alliance) or General (for the horde).',
    AD_PVP_RANK13 = 'Get the rank of Field Marshal (for alliance) or Warlord (for the horde).',
    AD_PVP_RANK14 = 'Get the rank of Grand Marshal (for alliance) or High Warlord (for the horde).',
    
	AN_PVP_FIRST_KILL = 'PvP Victory',
    AD_PVP_FIRST_KILL = 'Claim your first honorable kill.',
    AC_PVP_FIRST_KILL = 'Claimed first honorable kill',
    AN_PVP_KILLS = '%d Honorable Kills',
    AD_PVP_KILLS = 'Get %d honorable kills.',
    AC_PVP_KILLS = 'Got %d honorable kills',
	
	AN_HORDE_PVP_FRACTIONS = 'Honorary Warrior of the Horde',
    AD_HORDE_PVP_FRACTIONS = 'Reach Exalted with the following Horde Forces factions.',
	AN_ALLIANCE_PVP_FRACTIONS = 'Honorary Soldier of the Alliance',
    AD_ALLIANCE_PVP_FRACTIONS = 'Reach Exalted with the following Alliance Forces factions.',
	
	AN_THRALL_SLAYER = 'New Warchief',
    AD_THRALL_SLAYER = 'Defeat Thrall in Orgrimmar.',	
    AN_VOLJIN_SLAYER = 'Death to the messenger of spirits',
    AD_VOLJIN_SLAYER = 'Defeat Vol\'jin in Orgrimmar.',	
    AN_SYLVANAS_SLAYER = 'Coup in Undercity',
    AD_SYLVANAS_SLAYER = 'Defeat Lady Sylvanas Windrunner in Undercity.',	
    AN_CAIRNE_SLAYER = 'Head Cow',
    AD_CAIRNE_SLAYER = 'Defeat Cairne Bloodhoof in Thunder Bluff.',
    AN_HORDE_KINGS_SLAYER = 'Horde Leaders',
    AD_HORDE_KINGS_SLAYER = 'Defeat the leaders of the Horde listed below.',
	
	AN_BOLVAR_SLAYER = 'Coup in Stormwind',
    AD_BOLVAR_SLAYER = 'Defeat Highlord Bolvar Fordragon in Stormwind.',
    AN_MAGNI_SLAYER = 'New king',
    AD_MAGNI_SLAYER = 'Defeat King Magni Bronzebeard in Ironforge.',
    AN_MEKKATORQUE_SLAYER = 'Goblins > Gnomes',
    AD_MEKKATORQUE_SLAYER = 'Defeat High Tinker Mekkatorque in Ironforge.',
    AN_TYRANDE_SLAYER = 'Death to the priestess',
    AD_TYRANDE_SLAYER = 'Defeat Tyrande Whisperwind in Darnassus.',
    AN_ALLIANCE_KINGS_SLAYER = 'Alliance Leaders',
    AD_ALLIANCE_KINGS_SLAYER = 'Defeat the leaders of the Alliance listed below.',
	
    AN_RACES_KILLER = 'Know Thy Enemy',
    AD_ALLIANCE_RACES_KILLER = 'Get a killing blow against all Alliance races.',
    AD_HORDE_RACES_KILLER = 'Get a killing blow against all Horde races.',
    AC_HUMAN_KILLED = 'Human killed',
    AC_NIGHTELF_KILLED = 'Night elf killed',
    AC_DWARF_KILLED = 'Dward killed',
    AC_GNOME_KILLED = 'Gnome killed',
    AC_ORC_KILLED = 'Orc killed',
    AC_TROLL_KILLED = 'Troll killed',
    AC_SCOURGE_KILLED = 'Undead killed',
    AC_TAUREN_KILLED = 'Tauren killed',

    AN_CLASSES_KILLER = 'That Takes Class',
    AD_CLASSES_KILLER = 'Get a killing blow on one of each class.',
    AC_WARRIOR_KILLED = 'Warrior killed',
    AC_HUNTER_KILLED = 'Hunter killed',
    AC_ROGUE_KILLED = 'Rogue killed',
    AC_PRIEST_KILLED = 'Priest killed',
    AC_MAGE_KILLED = 'Mage killed',
    AC_WARLOCK_KILLED = 'Warlock killed',
    AC_DRUID_KILLED = 'Druid killed',
    AC_PALADIN_KILLED = 'Paladin killed',
    AC_SHAMAN_KILLED = 'Shaman killed',
	
	AN_BGS_KILLING_BLOWS = 'Deathbringer',
    AD_BGS_KILLING_BLOWS = 'Make %d killing blows on battlegrounds you did not leave.',
	
    AN_BGS_KILLS = 'Honor aggregator',
    AD_BGS_KILLS = 'Get %d honorable kills on battlegrounds you did not leave.',
	
	AN_DUEL = 'For the first time',
    AD_DUEL = 'Одержите победу в своей первой дуэли.',
    AN_DUELS_10 = 'Duelist',
    AN_DUELS_25 = 'Skilled duelist',
    AN_DUELS_100 = 'Master duelist',
    AD_DUELS = 'Win in a duel.',
    AC_DUELS = 'Won in %d duels',
	
	AN_GURUBASHI_1 = 'Gurubashi Arena Master',
    AD_GURUBASHI_1 = 'Loot the Arena Master trinket from the Gurubashi Arena.',
	AN_GURUBASHI_2 = 'Gurubashi Arena Grand Master',
    AD_GURUBASHI_2 = 'Complete Short John Mithril\'s quest to obtain the Arena Grand Master thinket.',
	
	AN_PARTICIPATE_IN_BGS = 'Call to Arms!',
    AD_PARTICIPATE_IN_BGS = 'Complete %d battlegrounds at max level.',
    AC_PARTICIPATE_IN_BGS = 'Completed %d battlegrounds at max level',
	
	AN_BATTLEMASTER = 'Battlemaster',
    AD_BATTLEMASTER = 'Complete the battleground achievements listed below.',
    AR_BATTLEMASTER = 'The unspoken title of Battlemaster.',
	
	-- Alterac Valley sub-category
	AN_FROSTWOLF_CLAN = 'Frost wolf',
    AD_FROSTWOLF_CLAN = 'Reach Exalted with the Frostwolf Clan.',
	AN_STORMSPIKE_GUARD = 'Stormguard',
    AD_STORMSPIKE_GUARD = 'Reach Exalted with Stormspike Guards.',
	
	AN_ALTERAC_WIN = 'Victory in the Alterac Valley',
    AD_ALTERAC_WIN = 'Win the battle for Alterac Valley.',
    AN_ALTERAC_WINS = '%d victories in the Alterac Valley',
    AD_ALTERAC_WINS = 'Win %d battles for Alterac Valley.',
	
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
	
	AN_ALTERAC_TOWER_DEFEND_TOTAL = 'Tower Defense',
    AD_ALTERAC_TOWER_DEFEND_TOTAL = 'Defend %d towers in Alterac Valley.',
	
	AN_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = 'Alterac Grave Robber',
    AD_ALTERAC_GRAVEYARD_ASSAULT_TOTAL = 'Take %d graveyards in Alterac Valley.',
	
	AN_ALTERAC_MOUNT_ALLIANCE = 'Stormpike Battle Charger',
    AD_ALTERAC_MOUNT_ALLIANCE = 'Obtain a Stormpike Battle Charger.',
	
	AN_ALTERAC_BOSS = 'Master of Alterac Valley',
    AD_ALTERAC_BOSS = 'Complete the Alterac Valley achievements listed below.',
	
	-- Warsong Gulch sub-category
	AN_WARSONG_OUTRIDERS = 'There is only one song',
    AD_WARSONG_OUTRIDERS = 'Reach Exalted with Warsong Outriders.',
	AN_SILVERWING_SENTINELS = 'Silver wings',
    AD_SILVERWING_SENTINELS = 'Reach Exalted with Silverwing Sentinels.',
	
	AN_WARSONG_WIN = 'Victory in the Gulch',
    AD_WARSONG_WIN = 'Win the battle for Warsong Gulch.',
    AN_WARSONG_WINS = '%d victories in the Gulch',
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
    AN_ARATHI_WINS = '%d victories in the Basin',
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
	PROF_FIRST_AID = 'First Aid',
    PROF_FISHING = 'Fishing',
    PROF_COOKING = 'Cooking',
    PROF_ENCHANTING = 'Enchanting',
    PROF_TAILORING = 'Tailoring',
    PROF_ENGINEERING = 'Engineering',
    PROF_LEATHERWORKING = 'Leatherworking',
    PROF_ALCHEMY = 'Alchemy',
    PROF_BLACKSMITHING = 'Blacksmithing',
    PROF_HERBALISM = 'Herbalism',
    PROF_MINING = 'Mining',
    PROF_SKINNING = 'Skinning',
	
	AN_PROFS_SECONDARY = 'Both the priest and the reaper',
    AD_PROFS_SECONDARY = 'Raise the skill of all secondary professions to 300 at the same time.',
	
    AN_PROFS_FIVE = 'Genius is brilliant in everything',
    AD_PROFS_FIVE = 'Earn profession achievements listed below.',
	
	AN_PROFS_JOURNEYMAN = 'Journeyman',
    AD_PROFS_JOURNEYMAN = 'Raise the skill of any main profession to 75.',
    AN_PROFS_EXPERT = 'Expert',
    AD_PROFS_EXPERT = 'Raise the skill of any main profession to 150.',
    AN_PROFS_ARTISAN = 'Artisan',
    AD_PROFS_ARTISAN = 'Raise the skill of any main profession to 225.',
    AN_PROFS_ONE = 'Master',
    AD_PROFS_ONE = 'Raise the skill of any main profession to 300.',
    AN_PROFS_TWO = 'Handyman',
    AD_PROFS_TWO = 'Raise the skill of two main professions to 300 at the same time.',
    AC_PROFS_TWO = 'Raised the skill of two main professions to 300 at the same time.',
	
	-- Cooking sub-category
	AN_COOKING_JOURNEYMAN = 'Apprentice culinary',
    AD_COOKING_JOURNEYMAN = 'Raise the skill of cooking to 75.',
    AN_COOKING_EXPERT = 'Skillful cook',
    AD_COOKING_EXPERT = 'Raise the skill of cooking to 150.',
    AN_COOKING_ARTISAN = 'Smart cook',
    AD_COOKING_ARTISAN = 'Raise the skill of cooking to 225.',
    AN_COOKING_MASTER = 'Chef',
    AD_COOKING_MASTER = 'Raise the skill of cooking to 300.',
	
	AN_COOKING_RECIPES_30 = 'Exploring goodies',
    AN_COOKING_RECIPES_50 = 'Nutritional life',
    AN_COOKING_RECIPES_60 = 'Food is my middle name',
    AN_COOKING_RECIPES_70 = 'Recipe master',
    AN_COOKING_RECIPES_80 = 'Adept of Azeroth dishes',
    AR_COOKING_RECIPES = 'The unspoken title of the Adept of Azeroth dishes.',
    AD_COOKING_RECIPES = 'Learn recipes for %d dishes.',
    AC_COOKING_RECIPES = 'Larned %d dishes recipes',
	
	AD_COOKING_CREATE = 'Cook %s %d times.',
    AC_COOKING_CREATE = 'Cooked %d times',

	AN_COOKING_SOUP = 'Soupbrewer',	
    AN_COOKING_DESSERT = 'Pastry-cook',	
    AN_COOKING_SQUID = 'Seafood on the table today',	
    AN_COOKING_DUMPLINGS = 'Grandma\'s dumplings',
	AN_COOKING_CHOPS = 'Super nutritious chops',
	
	AN_COOKING_BIG_TABLE = 'Large festive table',
    AD_COOKING_BIG_TABLE = 'Complete the Cooking Large Amount achievements listed below.',
	
	-- Fishing sub-category
	AN_FISHING_JOURNEYMAN = 'Beginner angler',
    AD_FISHING_JOURNEYMAN = 'Raise the skill of fishing to 75.',
    AN_FISHING_EXPERT = 'Skillful angler',
    AD_FISHING_EXPERT = 'Raise the skill of fishing to 150.',
    AN_FISHING_ARTISAN = 'Artisan angler',
    AD_FISHING_ARTISAN = 'Raise the skill of fishing to 225.',
    AN_FISHING_MASTER = 'Famous angler',
    AD_FISHING_MASTER = 'Raise the skill of fishing to 300.',
	
	AN_FISHING_ROD = 'I choose the best for fishing',
    AD_FISHING_ROD = 'Take a win in a Stranglethorn Fishing Extravaganza and choose Arcanite Fishing Pole as your reward.',
	
    AN_FISHING_TRINKET = 'Real fish lover',
    AD_FISHING_TRINKET = 'Take a win in a Stranglethorn Fishing Extravaganza and choose Hook of the Master Angler as your reward.',

    AN_FISHING_COLLECTION = 'Fish collection',
    AD_FISHING_COLLECTION = 'Fish out the following fishes in Azeroth.',
	
    AN_FISHING_WATER = 'Water from water',
    AD_FISHING_WATER = 'Fish out the substance of water.',
	
    AN_FISHING_RUM = 'I do not put down',
    AD_FISHING_RUM = 'Fish out the following types of rum.',
	AC_FISHING_RUM_BLACK = 'Rumsey Rum Black Label',
    AC_FISHING_RUM_WHITE = 'Rumsey Rum Light',
	
    AN_FISHING_RING = 'Gift out of Mordor',
    AD_FISHING_RING = 'Fish out The 1 Ring.',
	
    AN_FISHING_SKULL = 'Harbinger of a sad end',
    AD_FISHING_SKULL = 'Fish out Old Teamster\'s Skull.',
	
    AN_FISHING_SNAPPER = 'Great snapper catcher',
    AD_FISHING_SNAPPER = 'Fish snappers of the following sizes.',
    AC_FISHING_SNAPPER = '%d Pound Mud Snapper',
	
    AN_FISHING_SEA_BASS = 'Thunderstorm of perches',
    AD_FISHING_SEA_BASS = 'Fish redgills and groupers of the following sizes.',
    AC_FISHING_SEA_BASS = '%d Pound',
	
    AN_FISHING_SALMON = 'Salmon lover',
    AD_FISHING_SALMON = 'Fish salmons of the following sizes.',
    AC_FISHING_SALMON = '%d Pound Salmon',
	
    AN_FISHING_LOBSTER = 'Omar hunter',
    AD_FISHING_LOBSTER = 'Fish lobsters of the following sizes.',
    AC_FISHING_LOBSTER = '%d Pound Lobster',
	
    AN_FISHING_BIG_SIZE = 'Greatest Angler of Azeroth',
    AD_FISHING_BIG_SIZE = 'Complete the Large Fish achievements listed below.',
    AR_FISHING_BIG_SIZE = 'The unspoken title of Azeroth\'s Greatest Angler.',
	
	
	-- First Aid sub-category
	AN_FIRST_AID_JOURNEYMAN = 'Novice doctor',
    AD_FIRST_AID_JOURNEYMAN = 'Raise the skill of first aid to 75.',
    AN_FIRST_AID_EXPERT = 'Skillful doctor',
    AD_FIRST_AID_EXPERT = 'Raise the skill of first aid to 150.',
    AN_FIRST_AID_ARTISAN = 'Artisan doctor',
    AD_FIRST_AID_ARTISAN = 'Raise the skill of first aid to 225.',
    AN_FIRST_AID_MASTER = 'Field doctor',
    AD_FIRST_AID_MASTER = 'Raise the skill of first aid to 300.',
	
	AN_STOCKING_UP = 'Stocking up',
    AD_STOCKING_UP = 'Craft 100 heavy runecloth bandages.',
    AC_STOCKING_UP = 'Crafted 100 heavy runecloth bandages',
    AN_STOCKING_UP_2 = 'Stocking up with usury',
    AD_STOCKING_UP_2 = 'Craft 500 heavy runecloth bandages.',
    AC_STOCKING_UP_2 = 'Crafted 500 heavy runecloth bandages',
	
	AN_FISHING_ROD = 'I choose the best for fishing',
    AD_FISHING_ROD = 'Take a win in a Stranglethorn Fishing Extravaganza and choose Arcanite Fishing Pole as your reward.',
	
    AN_FISHING_TRINKET = 'Real fish lover',
    AD_FISHING_TRINKET = 'Take a win in a Stranglethorn Fishing Extravaganza and choose Hook of the Master Angler as your reward.',

    AN_FISHING_COLLECTION = 'Fish collection',
    AD_FISHING_COLLECTION = 'Fish out the following fishes in Azeroth.',
	
    AN_FISHING_WATER = 'Water from water',
    AD_FISHING_WATER = 'Fish out the substance of water.',
	
    AN_FISHING_RUM = 'I do not put down',
    AD_FISHING_RUM = 'Fish out the following types of rum.',
	
	-- ########################
	-- Reputations achievements
	-- ########################
	-- Main category	
    AN_REPS_1 = 'Someone likes me!',
    AD_REPS_1 = 'Raise any reputation to Exalted.',
    AC_REPS_1 = 'Raised any reputation to Exalted.',
    AN_REPS_2 = 'Two courtyards',
    AN_REPS_3 = 'Darling',
    AN_REPS_4 = 'Adored',
    AN_REPS_5 = 'Exalted',
    AN_REPS_6 = 'Venerable',
    AN_REPS_7 = 'Highly esteemed',
    AD_REPS = 'Raise %d reputations to Exalted.',
    AC_REPS = 'Raised %d reputations to Exalted.',
    AR_REPS = 'The unspoken title is akin to the title of the achievement!',

    AN_HORDE_REPS = 'Voice of the Horde',
    AD_HORDE_REPS = 'Reach Exalted with the Horde factions listed below.',
    AC_HORDE_REPS_1 = 'Exalted with Orgrimmar.',
    AC_HORDE_REPS_2 = 'Exalted with the Darkspear Tribe.',
    AC_HORDE_REPS_3 = 'Exalted with Undercity.',
    AC_HORDE_REPS_4 = 'Exalted with Thunder Bluff.',
    AN_ALLIANCE_REPS = 'Alliance Herald',
    AD_ALLIANCE_REPS = 'Reach Exalted with the Alliance factions listed below.',
    AC_ALLIANCE_REPS_1 = 'Exalted with Stormwind.',
    AC_ALLIANCE_REPS_2 = 'Exalted with Darnassus.',
    AC_ALLIANCE_REPS_3 = 'Exalted with the Gnomeregan Exiles.',
    AC_ALLIANCE_REPS_4 = 'Exalted with Ironforge.',
	
	AN_HYDRAXIANS = 'True Hydraxian',
    AD_HYDRAXIANS = 'Reach Exalted with the Hydraxian Waterlods.',
	
	AN_ZANDALAR_TRIBE = 'Hakkar\'s horror',
    AD_ZANDALAR_TRIBE = 'Reach Exalted with the Zandalar Tribe.',
	
	AN_CENARION_CIRCLE = 'Defender of nature',
    AD_CENARION_CIRCLE = 'Reach Exalted with the Cenarion Circle.',
	
	AN_BROOD_OF_NOZDORMU = 'Time Lord',
    AD_BROOD_OF_NOZDORMU = 'Reach Exalted with the Brood of Nozdormu.',

    AN_ARGENT_DAWN = 'Hand of Dawn',
    AD_ARGENT_DAWN = 'Reach Exalted with the Argent Dawn.',
	
	AN_TIMBERMAW_HOLD = 'Not made of wood, but with a belly',
    AD_TIMBERMAW_HOLD = 'Reach Exalted with Timbermaw.',   
    
    AN_DARKMOON_FAIRE = 'Fulldarkmoon',
    AD_DARKMOON_FAIRE = 'Reach Exalted with the faction of Darkmoon Faire.',    
    
    AN_PIRATES = 'Yar-r-r!',
    AD_PIRATES = 'Reach Honored with the Bloodsail Buccaneers.',
	
    AN_SHENDRALAR = 'Did I tell you what madness is?',
    AD_SHENDRALAR = 'Reach Exalted with Shen\'dralar.',
	
	-- ##############################
	-- World Exploration achievements
	-- ##############################
	-- Main category
	AN_EXPLORE_AZEROTH = 'Azeroth Explorer',
    AD_EXPLORE_AZEROTH = 'Explore the world of Azeroth!',
	
    AN_EXPLORE_KALIMDOR = 'Kalimdor Explorer',
    AD_EXPLORE_KALIMDOR = 'Explore locations of Kalimdor listed below.',
	
    AN_EXPLORE_EASTERN_KINGDOMS = 'Eastern Kingdoms Explorer',
    AD_EXPLORE_EASTERN_KINGDOMS = 'Explore locations of Eastern Kingdoms listed below.',
	
	AN_LOVE = 'To All The Squirrels I\'ve Loved Before',
    AD_LOVE = 'Show the critters of Azeroth how much you /love them.',
	EMOTE_LOVE1 = 'You love %s.',    
    EMOTE_PAT1 = 'You gently pat %s.',
	NPC_3444 = 'Dig rat',
    NPC_620 = 'Chicken',
    NPC_1420 = 'Toad',
    NPC_13321 = 'Frog',
    NPC_2620 = 'Prairie Dog',
    NPC_9600 = 'Parrot',
    NPC_5951 = 'Hare',
    NPC_9699 = 'Fire Beetle',
    NPC_4953 = 'Moccasin',
    NPC_721 = 'Rabbit',
    NPC_9700 = 'Lava Crab',
    NPC_15476 = 'Scorpion',
    NPC_2914 = 'Snake',
    NPC_16030 = 'Maggot',
    NPC_4075 = 'Rat',
    NPC_1412 = 'Squirrel',
    NPC_7390 = 'Cockatiel',
    NPC_15475 = 'Beetle',
    NPC_15010 = 'Jungle Toad',
    NPC_4076 = 'Roach',
    NPC_13016 = 'Deeprun Rat',
    NPC_14881 = 'Spider',
    NPC_2110 = 'Black Rat',
    NPC_4166 = 'Gazelle',
    NPC_1933 = 'Sheep',
    NPC_890 = 'Fawn',
    NPC_2098 = 'Ram',
    NPC_2442 = 'Cow',
    NPC_6368 = 'Cat',
    NPC_10582 = 'Dog',
    NPC_385 = 'Horse',
    NPC_10685 = 'Swine',
    NPC_3300 = 'Adder',
    NPC_15066 = 'Cleo',
    NPC_15071 = 'Underfoot',
	
	-- For all explore achievements
	AD_EXPLORE = 'Explore %s.',
	
	
	-- ##############################
	-- Feats of Strenght achievements
	-- ##############################
	-- Main category
	AN_SULFURAS = 'Sulfuras, Hand of Ragnaros',
    AD_SULFURAS = 'Wielder of Sulfuras, Hand of Ragnaros.',
	
    AN_THUNDER_FURY = 'Thunderfury, Blessed Blade of the Windseeker',
    AD_THUNDER_FURY = 'Wielder of Thunderfury, Blessed Blade of the Windseeker.',
	
    AN_ATIESH = 'Atiesh, Greatstaff of the Guardian',
    AD_ATIESH = 'Wielder of Atiesh, Greatstaff of the Guardian.',
	
    AN_BLACK_SCARAB = 'Scarab Lord',
    AD_BLACK_SCARAB = 'Wielder of Black Qiraji Resonating Crystal.',
	
    AN_RED_SCARAB = 'Why? Because It\'s Red!',
    AD_RED_SCARAB = 'Wielder of Red Qiraji Resonating Crystal.'
})
