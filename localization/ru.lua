if GetLocale() ~= 'ruRU' then return end
SexyLib:Localization('Classic Achievements'):Add({
    achievement_earned = '&aДостижение получено %s %d/%d/%d',
    achievement_in_progress = '&7%s работает над получением достижения',

    ICON_DESCRIPTION = '&7Левая кнопка мыши: &eоткрыть/скрыть окно достижений\n&7Правая кнопка мыши: &eоткрыть настройки Classic Achievements\n\n&3С любовью от Махича :)',

    OPTION_SHARING = 'Делиться достижениями',
    OPTION_SHARING_DESC = 'Писать ли в чаты сообщения при получении очередного достижения.',
    OPTION_UPDATE_MAP_EXPLORATION = 'Проверить исследованные локации',
    OPTION_UPDATE_MAP_EXPLORATION_DESC = 'Засчитывает для достижений уже исследованные локации.',
    OPTION_RESET_ACHIEVEMENTS = 'Сбросить достижения',
    OPTION_RESET_ACHIEVEMENTS_DESC = 'Обнуляет весь прогресс достижений на этом персонаже. Это действие необратимо!',

    GOT_ACHIEVEMENT_MESSAGE_MALE = 'Я получил достижение %s!',
    GOT_ACHIEVEMENT_MESSAGE_FEMALE = 'Я получила достижение %s!',

    COMPARE_ACHIEVEMENTS = 'Сравнить достижения',
    TARGET_DOES_NOT_HAVE_ADDON = 'У цели не установлен аддон.',

    UPDATING_EXPLORED_AREAS = 'Обновляю информацию об исследованных локациях. Это займет несколько секунд.',
    UPDATED_EXPLORED_AREAS = '&aИнформация об исследованных локациях обновлена!',

    NOT_WORKING = 'не работает',

    GEAR_SLOT_HEAD = 'Головной убор',
    GEAR_SLOT_NECK = 'Ожерелье',
    GEAR_SLOT_SHOULDER = 'Наплечники',
    GEAR_SLOT_CHEST = 'Нагрудный доспех',
    GEAR_SLOT_WAIST = 'Пояс',
    GEAR_SLOT_LEGS = 'Штаны',
    GEAR_SLOT_FEET = 'Ботинки',
    GEAR_SLOT_WRIST = 'Наручи',
    GEAR_SLOT_HANDS = 'Перчатки',
    GEAR_SLOT_FIRST_RING = 'Первое кольцо',
    GEAR_SLOT_SECOND_RING = 'Второе кольцо',
    GEAR_SLOT_FIRST_TRINKET = 'Первая серьга',
    GEAR_SLOT_SECOND_TRINKET = 'Вторая серьга',
    GEAR_SLOT_CLOAK = 'Плащ',
    GEAR_SLOT_WEAPON = 'Оружие',

    CATEGORY_GENERAL = 'Общее',
    CATEGORY_QUESTS = 'Задания',
    CATEGORY_KALIMDOR = 'Калимдор',
    CATEGORY_EASTERN_KINGDOMS = 'Восточные королевства',
    CATEGORY_EXPLORATION = 'Исследование мира',
    CATEGORY_PVE = 'Подземелья и рейды',
    CATEGORY_INSTANCES = 'Подземелья',
    CATEGORY_RAIDS = 'Рейды',
    CATEGORY_WORLD_BOSSES = 'Мировые Боссы',
    CATEGORY_BATTLEGROUNDS = 'Поля боя',
    CATEGORY_BG_ALTERAC = 'Альтеракская долина',
    CATEGORY_BG_WARSONG = 'Ущелье Песни Войны',
    CATEGORY_BG_ARATHI = 'Нагорье Арати',
    CATEGORY_PROFESSIONS = 'Профессии',
    CATEGORY_REPUTATION = 'Репутации',
    CATEGORY_FEATS_OF_STRENGTH = 'Великие подвиги',
    CATEGORY_EVENTS = 'Игровые события',

    AN_LVL = '%d-й уровень',
    AD_LVL = 'Достигните %d-го уровня.',

    AN_BANK = 'Банковская ячейка',
    AD_BANK = 'Приобретите все дополнительные ячейки в банке.',
    AC_BANK = 'Приобретены все дополнительные ячейки в банке.',

    AN_QUESTS = '%d заданий',
    AD_QUESTS = 'Выполните %d заданий.',
    AC_QUESTS = 'Выполнено %d заданий',

    AN_QUEST_GOLD5 = 'Блестящая награда',
    AN_QUEST_GOLD10 = 'Собиратель чеканных монет',
    AN_QUEST_GOLD25 = 'Кормилец',
    AN_QUEST_GOLD50 = 'Заслуженное золотишко',
    AN_QUEST_GOLD100 = 'Заработано потом и кровью',
    AD_QUEST_GOLD = 'Получите %d золотых монет за выполнение заданий.',
    AC_QUEST_GOLD = 'Получено %d золотых монет за выполнение заданий.',

    AN_QUESTS_ZONE = 'Мудрость %s',
    AD_QUESTS_ZONE = 'Выполните задание "%s" в %s.',
    AD_QUESTS_ZONE_MULTI = 'Выполните перечисленные ниже задания в %s.',
    AC_QUESTS_ZONE = 'Задание "%s" выполнено.',

    AZSHARA_1 = 'Азшаре',
    AZSHARA_2 = 'Азшары',
    QUEST_3602 = 'Азшарит',

    FELWOOD_1 = 'Оскверненном лесу',
    FELWOOD_2 = 'Оскверненного леса',
    QUEST_5165 = 'Погасить Пламя Защиты',
    QUEST_5385 = 'Останки Трея Светогорна',

    DESOLACE_1 = 'Пустошах',
    DESOLACE_2 = 'Пустошей',
    QUEST_6027 = 'Книга Древних',

    DUSTWALLOW_1 = 'Пылевых топях',
    DUSTWALLOW_2 = 'Пылевых топей',
    QUEST_1203 = 'Ярлу нужен клинок',

    SILITHUS_1 = 'Силитусе',
    SILITHUS_2 = 'Силитуса',
    QUEST_8287 = 'Ужасная цель',
    QUEST_8352 = 'Скипетр Совета',
    QUEST_8321 = 'Вайрал Подлый',
    QUEST_8281 = 'Обеспечение безопасности',

    DUROTAR_1 = 'Дуротаре',
    DUROTAR_2 = 'Дуротара',
    QUEST_835 = 'Обеспечение безопасного сообщения',

    BARRENS_1 = 'Степях',
    BARRENS_2 = 'Степей',
    QUEST_888 = 'Украденное добро',
    QUEST_902 = 'Самофланж',

    WINTERSPRING_1 = 'Зимних Ключах',
    WINTERSPRING_2 = 'Зимних Ключей',
    QUEST_975 = 'Сокровище Мау\'ари',
    QUEST_5082 = 'Угроза со стороны Зимней Спячки',
    QUEST_5121 = 'Верховный вождь племени Зимней Спячки',
    QUEST_5163 = 'Йети где-то рядом...',
    QUEST_4842 = 'Выяснение причин',

    TANARIS_1 = 'Танарисе',
    TANARIS_2 = 'Танариса',
    QUEST_2662 = 'Эликсир Гогельмогеля',
    QUEST_2874 = 'Ром для Маккинли',
    QUEST_1691 = 'Еще одна расправа над Скитальцами Пустыни',
    QUEST_113 = 'Анализ частей насекомых',

    STONETALON_1 = 'Когтистых горах',
    STONETALON_2 = 'Когтистых гор',
    QUEST_1096 = 'Геренцо Терминатрикс',

    UNGORO_1 = 'Кратере Ун\'горо',
    UNGORO_2 = 'Кратера Ун\'горо',
    QUEST_3962 = 'Один в поле не воин',
    QUEST_4245 = 'В поисках Чи-Та 3',
    QUEST_4292 = 'Приманка для Лар\'корви',

    THOUSAND_NEEDLES_1 = 'Тысяче Игл',
    THOUSAND_NEEDLES_2 = 'Тысячи Игл',
    QUEST_1189 = 'Безопасность превыше всего',

    ARATHI_1 = 'Нагорье Арати',
    ARATHI_2 = 'Нагорья Арати',
    QUEST_652 = 'Разбить ключ-камень',

    BADLANDS_1 = 'Бесплодных землях',
    BADLANDS_2 = 'Бесплодных земель',
    QUEST_737 = 'Запретное знание',
    QUEST_778 = 'Сложная задача',
    QUEST_656 = 'Призыв принцессы',
    
    EASTERN_PLAGUELANDS_1 = 'Восточных Чумных землях',
    EASTERN_PLAGUELANDS_2 = 'Восточных Чумных земель',
    QUEST_5942 = 'Спрятанные сокровища',
    QUEST_6041 = 'Дымок над водою',
    QUEST_5265 = 'Серебряный оплот',

    BLASTED_LANDS_1 = 'Выжженных землях',
    BLASTED_LANDS_2 = 'Выжженных земель',
    QUEST_3628 = 'Ты - Рах\'лих, демон!',

    STRANGLETHORN_VALLEY_1 = 'Тернистой долине',
    STRANGLETHORN_VALLEY_2 = 'Тернистой долины',
    QUEST_208 = 'Охотник на крупную дичь',
    QUEST_600 = 'Рудник Торговой Компании',
    QUEST_613 = 'Вскрыть ногу Моури',
    QUEST_628 = 'Эксельзиор',
    QUEST_338 = 'Зеленые холмы Тернистой долины',

    WESTERN_PLAGUELANDS_1 = 'Западных Чумных землях',
    WESTERN_PLAGUELANDS_2 = 'Западных Чумных земель',
    QUEST_5944 = 'Во сне',
    QUEST_5051 = 'Вторая половина',
    QUEST_4985 = 'Страдания природы',

    SEARING_GORGE_1 = 'Тлеющем ущелье',
    SEARING_GORGE_2 = 'Тлеющего ущелья',
    QUEST_3481 = 'Безделушки...',

    BLACK_ROCK_1 = 'Черной Горе',
    BLACK_ROCK_2 = 'Черной Горы',
    QUEST_8996 = 'Возвращение к Бодли',

    AN_WISDOM_KEEPER = 'Хранитель мудрости',
    AD_WISDOM_KEEPER = 'Заработайте указанные ниже достижения, связанные с заданиями.',
    AN_WISDOM_KEEPER_KALIMDOR = 'Хранитель мудрости Калимдора',
    AD_WISDOM_KEEPER_KALIMDOR = 'Заработайте указанные ниже достижения, связанные с заданиями в Калимдоре.',
    AN_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Хранитель мудрости Восточных королевств',
    AD_WISDOM_KEEPER_EASTERN_KINGDOMS = 'Заработайте указанные ниже достижения, связанные с заданиями в Восточных королевствах.',

    AN_RAGEFIRE_CHASM = 'Огненная пропасть',
    AD_RAGEFIRE_CHASM = 'Победите Жергоша Призывателя Духов.',
    AN_WAILING_CAVERNS = 'Пещеры стенаний',
    AD_WAILING_CAVERNS = 'Победите Мутануса Пожирателя.',
    AN_DEAD_MINES = 'Мертвые копи',
    AD_DEAD_MINES = 'Победите Эдвина ван Клифа.',
    AN_SHADOWFANG_KEEP = 'Крепость темного клыка',
    AD_SHADOWFANG_KEEP = 'Победите Верховного мага Аругала.',
    AN_BLACKFATHOM_DEEPS = 'Непроглядная пучина',
    AD_BLACKFATHOM_DEEPS = 'Победите Аку\'май.',
    AN_JAIL = 'Тюрьма Штормграда',
    AD_JAIL = 'Победите Кама Гневливого.',
    AN_GNOMREGAN = 'Гномреган',
    AD_GNOMREGAN = 'Победите Мекжинера Термоштепселя.',
    AN_RAZORFEN_KRAUL = 'Лабиринты Иглошкурых',
    AD_RAZORFEN_KRAUL = 'Победите Чарлгу Остробок.',
    AN_SCARLET_MONASTERY = 'Монастырь Алого Ордена',
    AD_SCARLET_MONASTERY = 'Победите командиров в Монастыре Алого Ордена.',
    AC_SCARLET_MONASTERY1 = 'Волшебник крови Талнос побежден',
    AC_SCARLET_MONASTERY2 = 'Чародей Доан побежден',
    AC_SCARLET_MONASTERY3 = 'Герод побежден',
    AC_SCARLET_MONASTERY4 = 'Верховный инквизитор Вайтмейн побеждена',
    AN_RAZORFEN_DOWNS = 'Курганы Иглошкурых',
    AD_RAZORFEN_DOWNS = 'Победите Амненнара Хладовея и Чумобрюха Гнилого.',
    AC_RAZORFEN_DOWNS1 = 'Амненнар Хладовей побежден',
    AC_RAZORFEN_DOWNS2 = 'Чумобрюх Гнилой побежден',
    AN_ULDAMAN = 'Ульдаман',
    AD_ULDAMAN = 'Победите Аркедаса.',
    AN_ZULFARRAK = 'Зул\'Фаррак',
    AD_ZULFARRAK = 'Победите вождя Укорза Песчаную Плешь',
    AN_MARAUDON = 'Марадон',
    AD_MARAUDON = 'Победите принцессу Терадрас.',
    AN_SUNKEN_TEMPLE = 'Затонувший храм',
    AD_SUNKEN_TEMPLE = 'Одолейте тень Эраникуса.',
    AN_NEW_EMPEROR = 'Новый император',
    AD_NEW_EMPEROR = 'Убейте императора Даграна Тауриссана.',
    AN_BLACKROCK_DEPTHS = 'Зачистка глубин',
    AD_BLACKROCK_DEPTHS = 'Убейте указанных боссов в Глубинах Черной Горы.',
    AC_BLACKROCK_DEPTHS1 = 'Верховный дознаватель Герштан побежден',
    AC_BLACKROCK_DEPTHS2 = 'Псарь Гребмар побежден',
    AC_BLACKROCK_DEPTHS3 = 'Генерал Кузня Гнева побежден',
    AC_BLACKROCK_DEPTHS4 = 'Повелитель Големов Аргелмах побежден',
    AC_BLACKROCK_DEPTHS5 = 'Лорд Опалитель побежден',
    AC_BLACKROCK_DEPTHS6 = 'Тюремщик Стилгисс побежден',
    AC_BLACKROCK_DEPTHS7 = 'Бейл\'Гор побежден',
    AN_BLACKROCK_PARTY = 'Глубинная вечеринка',
    AD_BLACKROCK_PARTY = 'Одолейте всех возможных противников в трактире "Угрюмый Обжора".',
    AC_BLACKROCK_PARTY1 = 'Риббли Крутипроб одолен',
    AC_BLACKROCK_PARTY2 = 'Штоппор Наливалс одолен',
    AC_BLACKROCK_PARTY3 = 'Харли Чернопых одолен',
    AC_BLACKROCK_PARTY4 = 'Фаланкс одолен',
    AN_BLACKROCK_DEPTHS_FULL = 'Глубины Черной Горы',
    AD_BLACKROCK_DEPTHS_FULL = 'Заработайте указанные ниже достижения, связанные с Глубинами Черной Горы.',
    AN_ARMOR_SWORD = 'Лучшая защита - это нападение',
    AD_ARMOR_SWORD = 'Заберите Камень Земли с тела поверженного Панцера Непобедимого в Глубинах Черной Горы.',
    AN_BLACKROCK_SPIRE_BOTTOM = 'Нижняя часть пика Черной Горы',
    AD_BLACKROCK_SPIRE_BOTTOM = 'Убейте Властителя Змейталака.',
    AN_BLACKROCK_SPIRE_UPPER = 'Верхняя часть пика Черной Горы',
    AD_BLACKROCK_SPIRE_UPPER = 'Убейте Генерала Драккисата.',
    AN_BLACKROCK_SPIRE = 'Захватчик пика Черной Горы',
    AD_BLACKROCK_SPIRE = 'Заработайте указанные ниже достижения, связанные с Пиком Черной Горы.',
    AN_DIRE_MAUL = 'Правитель Забытого Города',
    AD_DIRE_MAUL = 'Очистите от врагов все части Забытого Города.',
    AC_DIRE_MAUL1 = 'Алззин Перевертень убит',
    AC_DIRE_MAUL2 = 'Принц Тортелдрин одален',
    AC_DIRE_MAUL3 = 'Король Гордок повержен',
    AN_STRATHOLME_LIVE = 'Живой квартал Стратхольма',
    AD_STRATHOLME_LIVE = 'Победите Балназзара.',
    AN_STRATHOLME_DEAD = 'Мертвый квартал Стратхольма',
    AD_STRATHOLME_DEAD = 'Победите Барона Ривендера.',
    AN_STRATHOLME = '"Спаситель" Стратхольма',
    AD_STRATHOLME = 'Заработайте указанные ниже достижения, связанные со Стратхольмом.',
    AN_SCHOLOMANCE = 'Некроситет',
    AD_SCHOLOMANCE = 'Победите Темного магистра Гандлинга.',
    AN_YOUNG_DEFENDER = 'Молодой защитник Азерота',
    AD_YOUNG_DEFENDER = 'Добейтесь указанных ниже достижений, связанных с низкоуровневыми подземельями.',
    AN_DEFENDER = 'Защитник Азерота',
    AD_DEFENDER = 'Добейтесь указанных ниже достижений, связанных с подземельями.',
    AR_DEFENDER = 'Негласное звание Защитника Азерота.',

    AN_ONYXIA = 'Логово Ониксии',
    AD_ONYXIA = 'Победите Ониксию.',
    AN_AQ20 = 'Руины Ан\'киража',
    AD_AQ20 = 'Одолейте Оссириана Неуязвимого.',
    AN_ZULGURUB = 'Зул\'гуруб',
    AD_ZULGURUB = 'Изгоните Хаккара из этого мира.',
    AN_RAGNAROS = 'Огненные Недра',
    AD_RAGNAROS = 'Одержите верх над Рагнаросом.',
    AN_BLACK_WING_LAIR = 'Логово Крыла Тьмы',
    AD_BLACK_WING_LAIR = 'Убейте Нефариана.',
    AN_AQ40 = 'Храм Ан\'Киража',
    AD_AQ40 = 'Победите К\'туна.',
    AN_NAXXRAMAS_SPIDERS = 'Паучий квартал Наксрамаса',
    AD_NAXXRAMAS_SPIDERS = 'Убейте Мексну.',
    AN_NAXXRAMAS_PLAGUE = 'Чумной квартал Наксрамаса',
    AD_NAXXRAMAS_PLAGUE = 'Покончите с Лотхибом.',
    AN_NAXXRAMAS_MILITARY = 'Военный квартал Наксрамаса',
    AD_NAXXRAMAS_MILITARY = 'Одержите верх в схватке с Четырьмя Всадниками.',
    AN_NAXXRAMAS_CONSTRUCT = 'Квартал мерзости Наксрамаса',
    AD_NAXXRAMAS_CONSTRUCT = 'Убейте Таддиуса.',
    AN_NAXXRAMAS_LAIR = 'Логово ледяного змея',
    AD_NAXXRAMAS_LAIR = 'Победите Кел\'тузада.',
    AN_NAXXRAMAS = 'Покоритель Наксрамаса',
    AD_NAXXRAMAS = 'Заработайте указанные ниже достижения, связанные с Наксрамасом.',
    AN_YOUNG_HERO = 'Молодой герой Азерота',
    AD_YOUNG_HERO = 'Добейтесь указанных ниже достижений, связанных с самыми простыми рейдовыми подземельями.',
    AN_BLACKROCK_MASTER = 'Владыка Черной Горы',
    AD_BLACKROCK_MASTER = 'Добейтесь указанных ниже достижений, связанных с Черной Горой.',
    AN_HERO = 'Герой Азерота',
    AD_HERO = 'Добейтесь указанных ниже достижений, связанных с рейдовыми подземельями.',
    AR_HERO = 'Негласное звание Героя Азерота.',
    AN_GREAT_HERO = 'Великий Герой Азерота',
    AD_GREAT_HERO = 'Добейтесь указанных ниже достижений, связанных с обычными и рейдовыми подземельями.',
    AR_GREAT_HERO = 'Негласное звание Великого Героя Азерота :)',

    AN_PVP_RANK = '%d-й PvP ранг',
    AD_PVP_RANK1 = 'Заслужите ранг рядового (для альянса) или разведчика (для орды).',
    AD_PVP_RANK2 = 'Заслужите ранг капрала (для альянса) или рубаки (для орды).',
    AD_PVP_RANK3 = 'Заслужите ранг сержанта.',
    AD_PVP_RANK4 = 'Заслужите ранг мастер-сержанта (для альянса) или старшего сержанта (для орды).',
    AD_PVP_RANK5 = 'Заслужите ранг сержант-майора (для альянса) или высшего сержанта (для орды).',
    AD_PVP_RANK6 = 'Заслужите ранг рыцаря (для альянса) или каменного стража (для орды).',
    AD_PVP_RANK7 = 'Заслужите ранг рыцарь-лейтенанта (для альянса) или кровавого стража (для орды).',
    AD_PVP_RANK8 = 'Заслужите ранг рыцарь-капитана (для альянса) или легионера (для орды).',
    AD_PVP_RANK9 = 'Заслужите ранг рыцарь-защитника (для альянса) или центуриона (для орды).',
    AD_PVP_RANK10 = 'Заслужите ранг лейтенант-командора (для альянса) или защитника (для орды).',
    AD_PVP_RANK11 = 'Заслужите ранг командора (для альянса) или генерал-лейтенанта (для орды).',
    AD_PVP_RANK12 = 'Заслужите ранг маршала (для альянса) или генерала (для орды).',
    AD_PVP_RANK13 = 'Заслужите ранг фельдмаршала (для альянса) или вождя (для орды).',
    AD_PVP_RANK14 = 'Заслужите ранг главнокомандующего (для альянса) или верховного вождя (для орды).',
    AN_PVP_FIRST_KILL = 'Победа в PvP',
    AD_PVP_FIRST_KILL = 'Одержите почетную победу в PvP.',
    AC_PVP_FIRST_KILL = 'Одержана почетная победа в PvP',
    AN_PVP_KILLS = '%d почетных побед в PvP',
    AD_PVP_KILLS = 'Одержите %d почетных побед в PvP.',
    AC_PVP_KILLS = 'Одержано %d почетных побед в PvP',

    AN_MOB_KILLS_1 = 'Убивца',
    AN_MOB_KILLS_2 = 'Истребитель',
    AN_MOB_KILLS_3 = 'Крушитель',
    AN_MOB_KILLS_4 = 'Охотник за головами',
    AN_MOB_KILLS_5 = 'Гроза монстров',
    AN_MOB_KILLS_6 = 'Гроза всего живого',
    AN_MOB_KILLS_7 = 'Вездесущая смерть',
    AD_MOB_KILLS = 'Убейте %d монстров.',
    AC_MOB_KILLS = 'Убито %d монстров.',

    AN_REPS_1 = 'Я кому-то нравлюсь!',
    AD_REPS_1 = 'Добейтесь превознесения с любой фракцией.',
    AC_REPS_1 = 'Превознесение с любой фракцией.',
    AN_REPS_2 = 'Два двора',
    AN_REPS_3 = 'Любимчик',
    AN_REPS_4 = 'Обожаемый',
    AN_REPS_5 = 'Превозносимый',
    AN_REPS_6 = 'Досточтимый',
    AN_REPS_7 = 'Высокочтимый',
    AD_REPS = 'Добейтесь превознесения с %d фракциями.',
    AC_REPS = 'Превознесение с %d фракциями.',
    AR_REPS = 'Негласное звание сродни названию достижения!',

    AN_HORDE_REPS = 'Знамя Орды',
    AD_HORDE_REPS = 'Добейтесь превознесения с указанными ниже фракциями Орды.',
    AC_HORDE_REPS_1 = 'Превознесение с Оргриммаром.',
    AC_HORDE_REPS_2 = 'Превознесение с Племенем Черного Копья.',
    AC_HORDE_REPS_3 = 'Превознесение с Подгородом.',
    AC_HORDE_REPS_4 = 'Превознесение с Громовым Утесом.',

    AN_ALLIANCE_REPS = 'Вестник Альянса',
    AD_ALLIANCE_REPS = 'Добейтесь превознесения с указанными ниже фракциями Альянса.',
    AC_ALLIANCE_REPS_1 = 'Превознесение со Штормградом.',
    AC_ALLIANCE_REPS_2 = 'Превознесение с Дарнассом.',
    AC_ALLIANCE_REPS_3 = 'Превознесение с Изгнанниками Гномрегана.',
    AC_ALLIANCE_REPS_4 = 'Превознесение со Стальгорном.',

    AN_ARGENT_DAWN = 'Десница рассвета',
    AD_ARGENT_DAWN = 'Добейтесь превознесения с Серебряным Рассветом.',
    AN_BROOD_OF_NOZDORMU = 'Повелитель времени',
    AD_BROOD_OF_NOZDORMU = 'Добейтесь превознесения с Родом Ноздорму.',
    AN_CENARION_CIRCLE = 'Защитник природы',
    AD_CENARION_CIRCLE = 'Добейтесь превознесения с Кругом Кенария.',
    AN_DARKMOON_FAIRE = 'Полноноволуние',
    AD_DARKMOON_FAIRE = 'Добейтесь превознесения с фракцией Ярмарки Новолуния.',
    AN_ZANDALAR_TRIBE = 'Ужас Хаккара',
    AD_ZANDALAR_TRIBE = 'Добейтесь превознесения с Племенем Зандалар.',
    AN_HYDRAXIANS = 'Истинный Гидраксианец',
    AD_HYDRAXIANS = 'Добейтесь превознесения с Гидраксианскими Повелителями Вод.',
    AN_TIMBERMAW_HOLD = 'Не из дерева, но с брюхом',
    AD_TIMBERMAW_HOLD = 'Добейтесь превознесения с Древобрюхами.',
    AN_PIRATES = 'Йар-р-р!',
    AD_PIRATES = 'Добейтесь уважения с Пиратами Кровавого Паруса.',
    AN_SHENDRALAR = 'Я тебе говорил, что такое безумие?',
    AD_SHENDRALAR = 'Добейтесь превознесения с Шен\'дралар.',

    AN_DEFILERS = 'За Осквернителей!',
    AD_DEFILERS = 'Добейтесь превознесения с Осквернителями.',
    AN_FROSTWOLF_CLAN = 'Северный волк',
    AD_FROSTWOLF_CLAN = 'Добейтесь превознесения с Кланом Северного Волка.',
    AN_WARSONG_OUTRIDERS = 'Есть лишь одна песня',
    AD_WARSONG_OUTRIDERS = 'Добейтесь превознесения с Всадниками Песни Войны.',
    AN_HORDE_PVP_FRACTIONS = 'Почетный воитель Орды',
    AD_HORDE_PVP_FRACTIONS = 'Добейтесь превознесения со следующими фракциями Сил Орды.',

    AN_LEAGUE_OF_ARATHOR = 'За Аратора!',
    AD_LEAGUE_OF_ARATHOR = 'Добейтесь превознесения Лиги Аратора.',
    AN_STORMSPIKE_GUARD = 'Грозовой страж',
    AD_STORMSPIKE_GUARD = 'Добейтесь превознесения Стражи Грозовой Вершины.',
    AN_SILVERWING_SENTINELS = 'Серебряные крылья',
    AD_SILVERWING_SENTINELS = 'Добейтесь превознесения Среброкрылых Часовых.',
    AN_ALLIANCE_PVP_FRACTIONS = 'Почетный воитель Альянса',
    AD_ALLIANCE_PVP_FRACTIONS = 'Добейтесь превознесения со следующими фракциями Сил Альянса.',

    AN_BOLVAR_SLAYER = 'Переворот в Штормграде',
    AD_BOLVAR_SLAYER = 'Одолейте Верховного Лорда Болвара Фордрагона в Штормграде.',
    AN_MAGNI_SLAYER = 'Новый король',
    AD_MAGNI_SLAYER = 'Одолейте Короля Магни Бронзоборода в Стальгорне.',
    AN_MEKKATORQUE_SLAYER = 'Гоблины > Гномы',
    AD_MEKKATORQUE_SLAYER = 'Одолейте Главного механика Меггакрута в Стальгорне.',
    AN_TYRANDE_SLAYER = 'Смерть жрице',
    AD_TYRANDE_SLAYER = 'Одолейте Тиранду Шелест Ветра в Дарнассе.',

    AN_ALLIANCE_KINGS_SLAYER = 'Предводители Альянса',
    AD_ALLIANCE_KINGS_SLAYER = 'Одолейте перечисленных ниже предводителей Альянса.',

    AN_THRALL_SLAYER = 'Новый Вождь',
    AD_THRALL_SLAYER = 'Одолейте Тралла в Оргриммаре.',
    AN_VOLJIN_SLAYER = 'Смерть вестнику духов',
    AD_VOLJIN_SLAYER = 'Одолейте Вол\'джина в Оргриммаре.',
    AN_SYLVANAS_SLAYER = 'Переворот в Подгороде',
    AD_SYLVANAS_SLAYER = 'Одолейте Леди Сильвану Ветрокрылую в Подгороде.',
    AN_CAIRNE_SLAYER = 'Главная корова',
    AD_CAIRNE_SLAYER = 'Одолейте Кэрна Кровавое Копыто в Громовом Утесе.',

    AN_HORDE_KINGS_SLAYER = 'Предводители Орды',
    AD_HORDE_KINGS_SLAYER = 'Одолейте перечисленных ниже предводителей Орды.',

    AN_RACES_KILLER = 'Знай врага',
    AD_ALLIANCE_RACES_KILLER = 'Одержите победу в PvP, убив по одному представителю рас Альянса.',
    AD_HORDE_RACES_KILLER = 'Одержите победу в PvP, убив по одному представителю рас Орды.',
    AC_HUMAN_KILLED = 'Человек убит',
    AC_NIGHTELF_KILLED = 'Ночной эльф убит',
    AC_DWARF_KILLED = 'Дварф убит',
    AC_GNOME_KILLED = 'Гном убит',
    AC_ORC_KILLED = 'Орк убит',
    AC_TROLL_KILLED = 'Тролль убит',
    AC_SCOURGE_KILLED = 'Нежить убита',
    AC_TAUREN_KILLED = 'Таурен убит',

    AN_CLASSES_KILLER = 'Вот это класс!',
    AD_CLASSES_KILLER = 'Одержите победу в PvP, убив по одному персонажу каждого класса.',
    AC_WARRIOR_KILLED = 'Воин убит',
    AC_HUNTER_KILLED = 'Охотник убит',
    AC_ROGUE_KILLED = 'Разбойник убит',
    AC_PRIEST_KILLED = 'Жрец убит',
    AC_MAGE_KILLED = 'Маг убит',
    AC_WARLOCK_KILLED = 'Чернокнижник убит',
    AC_DRUID_KILLED = 'Друид убит',
    AC_PALADIN_KILLED = 'Паладин убит',
    AC_SHAMAN_KILLED = 'Шаман убит',

    AN_ALTERAC_WIN = 'Победа на Альтеракской долине',
    AD_ALTERAC_WIN = 'Победите в сражении за Альтеракскую долину.',
    AN_ALTERAC_WINS = '%d побед на Альтеракской долине',
    AD_ALTERAC_WINS = 'Победите в %d сражениях за Альтеракскую долину.',
    AN_WARSONG_WIN = 'Победа в Ущелье',
    AD_WARSONG_WIN = 'Победите в сражении за Ущелье Песни Войны.',
    AN_WARSONG_WINS = '%d побед в Ущелье',
    AD_WARSONG_WINS = 'Победите в %d сражениях за Ущелье Песни Войны.',
    AN_ARATHI_WIN = 'Победа в Низине',
    AD_ARATHI_WIN = 'Победите в сражении за Низину Арати.',
    AN_ARATHI_WINS = '%d побед в Низине',
    AD_ARATHI_WINS = 'Победите в %d сражениях за Низиру Арати.',

    AN_ALTERAC_KILLING_BLOWS = 'Мясорубка долины',
    AD_ALTERAC_KILLING_BLOWS = 'Нанесите %d смертельных ударов за одно сражение за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_GRAVEYARD_ASSAULT = 'Гробовщик',
    AD_ALTERAC_GRAVEYARD_ASSAULT = 'Захватите кладбище при сражении за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_GRAVEYARD_ASSAULTS = 'Гробов мало не бывает',
    AD_ALTERAC_GRAVEYARD_ASSAULTS = 'Захватите %d кладбища в течение одного сражения за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_GRAVEYARD_DEFEND = 'Страж почивших',
    AD_ALTERAC_GRAVEYARD_DEFEND = 'Защитите кладбище при сражении за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_GRAVEYARD_DEFENDS = 'Страж всех почивших',
    AD_ALTERAC_GRAVEYARD_DEFENDS = 'Кладбища в количестве %d штук защищены в течение одного сражения за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_TOWER_ASSAULT = 'Теперь это мое!',
    AD_ALTERAC_TOWER_ASSAULT = 'Захватите башню при сражении за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_TOWER_ASSAULTS = 'Теперь все это мое!',
    AD_ALTERAC_TOWER_ASSAULTS = 'Захватите %d башни в течение одного сражения за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_TOWER_DEFEND = 'Хранитель башни',
    AD_ALTERAC_TOWER_DEFEND = 'Защитите башню при сражении за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_TOWER_DEFENDS = 'Хранитель башен',
    AD_ALTERAC_TOWER_DEFENDS = 'Башни в количестве %d штук защищены в течение одного сражения за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_MINE_CAPTURE = 'Промерзший шахтер',
    AD_ALTERAC_MINE_CAPTURE = 'Захватите рудник при сражении за Альтеракскую долину и пробудьте до завершения сражения.',
    AN_ALTERAC_MINE_CAPTURES = 'Промерзший рудокоп',
    AD_ALTERAC_MINE_CAPTURES = 'Захватите %d рудника в течение одного сражения за Альтеракскую долину и пробудьте до завершения сражения.',

    AN_WARSONG_KILLS = 'Военная честь',
    AD_WARSONG_KILLS = 'Заработайте %d почетных убийств в течение одного сражения за Ущелье Песни Войны и пробудьте до завершения сражения.',
    AN_WARSONG_FLAG_CAPTURE = 'Флагоносец',
    AD_WARSONG_FLAG_CAPTURE = 'Захватите флаг противников при сражении за Ущелье Песни Войны и пробудьте до завершения сражения.',
    AN_WARSONG_FLAG_CAPTURES = 'Великий флагоносец',
    AD_WARSONG_FLAG_CAPTURES = 'Захватите %d флага противников в течение одного сражения за Ущелье Песни Войны и пробудьте до завершения сражения.',
    AN_WARSONG_FLAG_RETURN = 'Не трожь!',
    AD_WARSONG_FLAG_RETURN = 'Верните на базу флаг своей фракции при сражении за Ущелье Песни Войны и пробудьте до завершения сражения.',
    AN_WARSONG_FLAG_RETURNS = 'Ничего не трожь!',
    AD_WARSONG_FLAG_RETURNS = 'Верните на базу %d флагов своей фракции в течение одного сражения за Ущелье Песни Войны и пробудьте до завершения сражения.',

    AN_ARATHI_BASE_ASSAULT = 'Конкистадор',
    AD_ARATHI_BASE_ASSAULT = 'Захватите строение при сражении за Низину Арати и пробудьте до завершения сражения.',
    AN_ARATHI_BASE_ASSAULTS = 'Именитый конкистадор',
    AD_ARATHI_BASE_ASSAULTS = 'Захватите %d строения в течение одного сражения за Низину Арати и пробудьте до завершения сражения.',
    AN_ARATHI_BASE_DEFEND = 'Караульный',
    AD_ARATHI_BASE_DEFEND = 'Защитите строение при сражении за Низину Арати и пробудьте до завершения сражения.',
    AN_ARATHI_BASE_DEFENDS = 'Почетный караульный',
    AD_ARATHI_BASE_DEFENDS = 'Защитите строения в количестве %d штук в течение одного сражения за Низину Арати и пробудьте до завершения сражения.',

    AN_BGS_KILLING_BLOWS = 'Несущий смерть',
    AD_BGS_KILLING_BLOWS = 'Нанесите %d смертельных ударов, находясь на полях сражений, на которых вы пробудете до завершения сражения.',
    AN_BGS_KILLS = 'Агрегатор чести',
    AD_BGS_KILLS = 'Заработайте %d почетных убийств, находясь на полях сражений, на которых вы пробудете до завершения сражения.',

    PROF_FIRST_AID = 'Первая помощь',
    PROF_FISHING = 'Рыбная ловля',
    PROF_COOKING = 'Кулинария',
    PROF_ENCHANTING = 'Наложение чар',
    PROF_TAILORING = 'Портняжное дело',
    PROF_ENGINEERING = 'Инженерное дело',
    PROF_LEATHERWORKING = 'Кожевничество',
    PROF_ALCHEMY = 'Алхимия',
    PROF_BLACKSMITHING = 'Кузнечное дело',
    PROF_HERBALISM = 'Травничество',
    PROF_MINING = 'Горное дело',
    PROF_SKINNING = 'Снятие шкур',
    SKILL_UNARMED = 'Рукопашный бой',

    AN_PROFS_JOURNEYMAN = 'Подмастерье',
    AD_PROFS_JOURNEYMAN = 'Повысьте навык владения любой основной профессией до 75.',
    AN_PROFS_EXPERT = 'Искусник',
    AD_PROFS_EXPERT = 'Повысьте навык владения любой основной профессией до 150.',
    AN_PROFS_ARTISAN = 'Умелец',
    AD_PROFS_ARTISAN = 'Повысьте навык владения любой основной профессией до 225.',
    AN_PROFS_ONE = 'Мастер',
    AD_PROFS_ONE = 'Повысьте навык владения любой основной профессией до 300.',
    AN_PROFS_TWO = 'Мастер на все руки',
    AD_PROFS_TWO = 'Повысьте навык владения двумя любыми основными профессиями до 300.',
    AC_PROFS_TWO = 'Навык владения двумя любыми основными профессиями повышен до 300.',

    AN_FIRST_AID_JOURNEYMAN = 'Начинающий врач',
    AD_FIRST_AID_JOURNEYMAN = 'Повысьте навык владения первой помощью до 75.',
    AN_FIRST_AID_EXPERT = 'Искусный врач',
    AD_FIRST_AID_EXPERT = 'Повысьте навык владения первой помощью до 150.',
    AN_FIRST_AID_ARTISAN = 'Умелый врач',
    AD_FIRST_AID_ARTISAN = 'Повысьте навык владения первой помощью до 225.',
    AN_FIRST_AID_MASTER = 'Полевой врач',
    AD_FIRST_AID_MASTER = 'Повысьте навык владения первой помощью до 300.',
    AN_FISHING_JOURNEYMAN = 'Начинающий рыболов',
    AD_FISHING_JOURNEYMAN = 'Повысьте навык рыбной ловли до 75.',
    AN_FISHING_EXPERT = 'Искусный рыболов',
    AD_FISHING_EXPERT = 'Повысьте навык рыбной ловли до 150.',
    AN_FISHING_ARTISAN = 'Умелый рыболов',
    AD_FISHING_ARTISAN = 'Повысьте навык рыбной ловли до 225.',
    AN_FISHING_MASTER = 'Именитый рыболов',
    AD_FISHING_MASTER = 'Повысьте навык рыбной ловли до 300.',
    AN_COOKING_JOURNEYMAN = 'Кулинар-подмастерье',
    AD_COOKING_JOURNEYMAN = 'Повысьте навык кулинарии до 75.',
    AN_COOKING_EXPERT = 'Искусный кулинар',
    AD_COOKING_EXPERT = 'Повысьте навык кулинарии до 150.',
    AN_COOKING_ARTISAN = 'Умелый кулинар',
    AD_COOKING_ARTISAN = 'Повысьте навык кулинарии до 225.',
    AN_COOKING_MASTER = 'Шеф',
    AD_COOKING_MASTER = 'Повысьте навык кулинарии до 300.',
    AN_PROFS_SECONDARY = 'И жрец, и жнец',
    AD_PROFS_SECONDARY = 'Повысьте навык владения всеми второстепенными профессиями до 300.',
    AN_PROFS_FIVE = 'Гений гениален во всем',
    AD_PROFS_FIVE = 'Добейтесь указанных ниже достижений, связанных с профессиями.',
    AN_UNARMED_SKILL = 'Кому зуботычину?',
    AD_UNARMED_SKILL = 'Повысьте навык рукопашного боя до 300.',

    AN_EXPLORE_AZEROTH = 'Исследователь Азерота',
    AD_EXPLORE_AZEROTH = 'Исследуйте мир Азерота!',
    AN_EXPLORE_KALIMDOR = 'Исследователь Калимдора',
    AD_EXPLORE_KALIMDOR = 'Исследуйте перечисленные ниже локации Калимдора.',
    AN_EXPLORE_EASTERN_KINGDOMS = 'Исследователь Восточных Королевств',
    AD_EXPLORE_EASTERN_KINGDOMS = 'Исследуйте перечисленные ниже локации Восточных Королевств.',
    AD_EXPLORE = '%s: перечисленные ниже зоны локации исследованы.',

    AN_SULFURAS = 'Сальфарас, рука Рагнароса',
    AD_SULFURAS = 'Владелец Сальфараса, руки Рагнароса.',
    AN_THUNDER_FURY = 'Громовая ярость, благословенный клинок Искателя ветра',
    AD_THUNDER_FURY = 'Владелец Громовой ярости, благословенного клинка Искателя ветра.',
    AN_ATIESH = 'Атиеш, большой посох Стража',
    AD_ATIESH = 'Владелец Атиеша, большого посоха Стража.',
    AN_BLACK_SCARAB = 'Повелитель Скарабеев',
    AD_BLACK_SCARAB = 'Владелец черного киражского боевого танка.',
    AN_RED_SCARAB = 'Почему? Потому что он красный!',
    AD_RED_SCARAB = 'Владелец красного киражского боевого танка.',
    
    AN_UNCOMMON_GEAR = 'Уже не такой обычный',
    AD_UNCOMMON_GEAR = 'Экипируйте себя предметами необычного качества или выше.',
    AN_RARE_GEAR = 'Просто превосходный боец',
    AD_RARE_GEAR = 'Экипируйте себя предметами редкого (превосходного) качества или выше.',
    AN_EPIC_GEAR = 'Эпическое снаряжение',
    AD_EPIC_GEAR = 'Экипируйте себя предметами эпического качества или выше.',

    AN_STOCKING_UP = 'Запасаемся',
    AD_STOCKING_UP = 'Создайте 100 плотных бинтов из рунной ткани.',
    AC_STOCKING_UP = 'Создано 100 плотных бинтов из рунной ткани',
    AN_STOCKING_UP_2 = 'Запасаемся с лихвой',
    AD_STOCKING_UP_2 = 'Создайте 500 плотных бинтов из рунной ткани.',
    AC_STOCKING_UP_2 = 'Создано 500 плотных бинтов из рунной ткани',

    AN_FISHING_ROD = 'Для рыбалки я выбираю лучшее',
    AD_FISHING_ROD = 'Одержите победу в Рыбомании Тернистой Долины и обзаведитесь Арканитовой удочкой.',
    AN_FISHING_TRINKET = 'Настоящий рыбоман',
    AD_FISHING_TRINKET = 'Одержите победу в Рыбомании Тернистой Долины и обзаведитесь Крючком мастера Англера.',

    AN_FISHING_COLLECTION = 'Рыбная коллекция',
    AD_FISHING_COLLECTION = 'Выудите следующих рыб в мире Азерота.',
    AN_FISHING_WATER = 'Водица из водицы',
    AD_FISHING_WATER = 'Выудите субстанцию воды.',
    AN_FISHING_RUM = 'Я не проставляюсь',
    AD_FISHING_RUM = 'Выудите указанные виды рома.',
    AC_FISHING_RUM_BLACK = 'Ром Рэмси "Черный ярлык"',
    AC_FISHING_RUM_WHITE = 'Белый ром Рэмси',
    AN_FISHING_RING = 'Подарок из Мордора',
    AD_FISHING_RING = 'Выудите Кольцо 1.',
    AN_FISHING_SKULL = 'Предвестие печального конца',
    AD_FISHING_SKULL = 'Выудите Череп старого игрока.',
    AN_FISHING_SNAPPER = 'Великий ловец луцианов',
    AD_FISHING_SNAPPER = 'Выудите луцианов указанных размеров.',
    AC_FISHING_SNAPPER = '%d-фунтовый илистый луциан',
    AN_FISHING_SEA_BASS = 'Гроза окуней',
    AD_FISHING_SEA_BASS = 'Выудите окуней указанных размеров.',
    AC_FISHING_SEA_BASS = '%d-фунтовый морской окунь',
    AN_FISHING_SALMON = 'Обожатель лососёвых',
    AD_FISHING_SALMON = 'Выудите лососей указанных размеров.',
    AC_FISHING_SALMON = '%d-фунтовый лосось',
    AN_FISHING_LOBSTER = 'Охотник за лобстерами',
    AD_FISHING_LOBSTER = 'Выудите омаров указанных размеров.',
    AC_FISHING_LOBSTER = '%d-фунтовый омар',
    AN_FISHING_BIG_SIZE = 'Величайший рыболов Азерота',
    AD_FISHING_BIG_SIZE = 'Выполните перечисленные ниже достижения по ловле рыб больших размеров.',
    AR_FISHING_BIG_SIZE = 'Негласное звание Величайшего рыболова Азерота.',

    AN_COOKING_RECIPES_30 = 'Изучение вкусностей',
    AN_COOKING_RECIPES_50 = 'Питательная жизнь',
    AN_COOKING_RECIPES_60 = 'Еда - мое второе имя',
    AN_COOKING_RECIPES_70 = 'Мастер рецептуры',
    AN_COOKING_RECIPES_80 = 'Знаток блюд Азерота',
    AR_COOKING_RECIPES = 'Негласное звание Знатока блюд Азерота.',
    AD_COOKING_RECIPES = 'Выучите рецепты %d блюд.',
    AC_COOKING_RECIPES = 'Выучено %d рецептов блюд',

    AN_COOKING_SOUP = 'Суповар',
    AN_COOKING_DESSERT = 'Кондитер',
    AN_COOKING_SQUID = 'Сегодня на столе морепродукты',
    AN_COOKING_DUMPLINGS = 'Бабушкины клёцки',
    AN_COOKING_CHOPS = 'Сверхпитательные отбивные',
    AD_COOKING_CREATE = 'Приготовьте %s в количестве %d шт.',
    AC_COOKING_CREATE = 'Приготовлено %d шт',
    AN_COOKING_BIG_TABLE = 'Большой праздничный стол',
    AD_COOKING_BIG_TABLE = 'Выполните перечисленные ниже достижения по приготовлению блюд в большом количестве.',

    AN_WB_AZUREGOS = 'Тайна синего дракона',
    AD_WB_AZUREGOS = 'Одержите победу над Азурегосом.',
    AN_WB_KAZZAK = 'Демоны не пройдут',
    AD_WB_KAZZAK = 'Одержите победу над Владыкой Каззаком.',
    AN_WB_YSONDRE = 'Нет места девушкам в кошмаре',
    AD_WB_YSONDRE = 'Одержите победу над Исондрой.',
    AN_WB_LETHON = 'Дитя изумрудного кошмара',
    AD_WB_LETHON = 'Одержите победу над Летоном.',
    AN_WB_EMERISS = 'Эмерисс, предатель жизни',
    AD_WB_EMERISS = 'Одержите победу над Эмериссом.',
    AN_WB_TAERAR = 'Кошмарный Таэрар',
    AD_WB_TAERAR = 'Одержите победу над Таэраром.',
    AN_WB_EMERALD_DRAGONS = 'Изумрудный хранитель',
    AD_WB_EMERALD_DRAGONS = 'Победите всех драконов изумрудного кошмара.',
    AR_WB_EMERALD_DRAGONS = 'Негласное звание Изумрудного хранителя.'

})