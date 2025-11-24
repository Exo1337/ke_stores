Config = {}

Config.Framework = "es_extended"
Config.InteractionDistance = 3.0
Config.CashierDistance = 3.0
Config.MaxCartDistance = 20.0

Config.Categories = {
    ['Frysprodukter'] = {
        {
            label = 'Macka med Ost',
            name = 'sandwich',
            price = 30,
        },
        {
            label = 'Billys Orginal',
            name = 'billys',
            price = 40,
        },
        {
            label = 'Kebabpizza',
            name = 'pizza5',
            price = 70,
        },
        {
            label = 'Margherita Pizza',
            name = 'pizza6',
            price = 70,
        },
        {
            label = 'Hamburgare',
            name = 'burger',
            price = 60,
        },
    },
    
    ['Dryck'] = {
        {
            label = 'Ramlösa',
            name = 'water',
            price = 10,
        },
    },
    
    ['Snacks'] = {
        {
            label = 'Marabou Daim',
            name = 'marabou2',
            price = 35,
        },
    },
    
    ['Diverse'] = {
        {
            label = 'Hacka',
            name = 'pickaxe',
            price = 1000,
        },
    },
    
    ['Tobak'] = {
        {
            label = 'John Silver',
            name = 'cigarette1',
            price = 80,
        },
    },
    
    ['Elektronik'] = {
        {
            label = 'iPhone 16',
            name = 'phone',
            price = 7500,
        },
    },
    
    ['Läkemedel'] = {
        {
            label = 'Tiger Balsam 25 g',
            name = 'tiger',
            price = 100,
        },
    },
    
    ['Sprit'] = {
        {
            label = 'Absolut Vodka',
            name = 'vodka',
            price = 400,
        },

    },
}

Config.Stores = {
    {
        name = 'Stora Coop',
        logo = 'https://r2.fivemanage.com/pN3z1DHpADRyEEFI0VgPv/stora-coop-logotyp-b-removebg-preview.png',
        blipSprite = 445,
        blipColor = 53,
        coords = { 
            vector3(30.7814, -1348.4751, 29.4970),
            vector3(-54.1142, -1754.5569, 29.4210),
            vector3(-713.9520, -915.7450, 19.2156),
            vector3(378.4556, 323.7729, 103.5664),
            vector3(1157.3013, -326.1964, 69.2050),
            vector3(2558.5977, 387.1206, 108.6229),
            vector3(-1824.5023, 787.3358, 138.2330),
            vector3(-3039.7964, 590.8762, 7.9089),
            vector3(-3240.7532, 1006.0853, 12.8307),
            vector3(542.8192, 2671.6106, 42.1565),     
            vector3(2682.0962, 3284.3301, 55.2411),     
            vector3(1700.8070, 4930.5405, 42.0636),   
            vector3(1733.0251, 6411.3901, 35.0372),   
            vector3(1966.2036, 3742.2585, 32.3438),
            vector3(243.9144, -888.2549, 29.5754),
        },
        cashierCoords = {
            vector3(25.7745, -1347.3009, 29.4970),
            vector3(-48.4509, -1757.9794, 29.4210),
            vector3(-707.4624, -914.5581, 19.2156),
            vector3(374.1626, 327.6932, 103.5664),
            vector3(1163.5867, -323.8149, 69.2050),
            vector3(2555.4768, 382.1610, 108.6229),
            vector3(-3040.9270, 585.2455, 7.9089),
            vector3(-3243.9114, 1001.4016, 12.8307),
            vector3(547.9454, 2669.4883, 42.1565),
            vector3(2677.0957, 3281.3945, 55.2411),
            vector3(1697.9446, 4924.5640, 42.0636),
            vector3(1729.6587, 6416.1826, 35.0372),
            vector3(1960.2924, 3742.0217, 32.3438),
            vector3(246.8005, -884.0106, 29.5754),
        },
        varor = {
            {
                category = 'Frysprodukter',
                coords = {
                    vector3(32.3125, -1342.9701, 29.4970),
                    vector3(-50.0222, -1749.4167, 29.4210),
                    vector3(-714.0247, -909.1774, 19.2156),
                    vector3(381.2293, 328.6495, 103.5664),
                    vector3(2553.2498, 388.9932, 108.6229),
                    vector3(-1829.1039, 792.0222, 138.2604),
                    vector3(-3045.4956, 590.8737, 7.9089),
                    vector3(-3245.8462, 1008.2915, 12.8307),
                    vector3(541.8079, 2665.9734, 42.1565),
                    vector3(2678.1082, 3288.3127, 55.2411),
                    vector3(1706.2969, 4926.7842, 42.0636),
                    vector3(1736.9822, 6415.4727, 35.0372),
                    vector3(1964.7971, 3747.6641, 32.3438),
                    vector3(248.4638, -891.5947, 29.5754),
                },
            },
            {
                category = 'Dryck',
                coords = { 
                    vector3(33.7379, -1346.7504, 29.4970),
                    vector3(-54.6126, -1748.6576, 29.4210),
                    vector3(-718.1620, -911.4414, 19.2156),
                    vector3(381.7373, 324.8785, 103.5664),
                    vector3(1152.5359, -322.6262, 69.2051),
                    vector3(2556.9417, 390.0697, 108.6229),
                    vector3(-1830.4261, 787.7162, 138.3268),
                    vector3(-3042.4370, 593.1588, 7.9089),
                    vector3(-3242.1714, 1009.2491, 12.8307),
                    vector3(539.9747, 2669.6460, 42.1565),
                    vector3(2681.9023, 3287.8223, 55.2411),
                    vector3(1706.6139, 4931.6738, 42.0636),
                    vector3(1736.3490, 6411.5615, 35.0372),
                    vector3(1967.9023, 3745.0933, 32.3438),
                    vector3(244.5880, -891.6180, 29.5754),
                },
            },
            {
                category = 'Snacks',
                coords = { 
                    vector3(28.8180, -1345.2474, 29.4970),
                    vector3(-50.4470, -1754.7417, 29.4210),
                    vector3(-711.0799, -913.5611, 19.2156),
                    vector3(378.7556, 326.6676, 103.5664),
                    vector3(1159.8895, -323.5916, 69.2052),
                    vector3(2555.8848, 388.1008, 108.6229),
                    vector3(-1824.4523, 792.1407, 138.1818),
                    vector3(-3042.3511, 589.6049, 7.9089),
                    vector3(-3243.6218, 1005.9801, 12.8307),
                    vector3(543.4989, 2668.7427, 42.1565),
                    vector3(2679.3337, 3285.4458, 55.2411),
                    vector3(1701.8773, 4925.8330, 42.0636),
                    vector3(1733.9539, 6414.3257, 35.0372),
                    vector3(1964.3226, 3744.4041, 32.3438),
                    vector3(246.6947, -888.8104, 29.5754),
                },
            },
            {
                category = 'Diverse',
                coords = { 
                    vector3(25.7468, -1345.5360, 29.4970),
                    vector3(-47.2964, -1756.5873, 29.4210),
                    vector3(-707.4220, -912.9719, 19.2156),
                    vector3(373.7283, 325.8320, 103.5664),
                    vector3(1163.2905, -322.1353, 69.2052),
                    vector3(2557.4434, 382.0849, 108.6229),
                    vector3(-1821.5848, 793.9482, 138.1169),
                    vector3(-3039.2617, 585.7309, 7.9089),
                    vector3(-3241.8738, 1001.2295, 12.8307),
                    vector3(547.7549, 2671.6526, 42.1565),
                    vector3(2678.7419, 3280.4609, 55.2411),
                    vector3(1699.4706, 4923.4233, 42.0636),
                    vector3(1728.9532, 6414.5596, 35.0372),
                    vector3(1961.3478, 3740.1985, 32.3438),
                    vector3(248.6563, -884.6237, 29.5754),
                },
            }
        }
    },
    {
        name = 'Elgiganten',
        logo = 'https://r2.fivemanage.com/pN3z1DHpADRyEEFI0VgPv/images-removebg-preview.png',
        blipSprite = 459,
        blipColor = 26,
        coords = { 
            vector3(-84.4468, 34.9970, 71.9541),
        },
        cashierCoords = {
            vector3(-87.8892, 32.1967, 71.9503),
        },
        varor = {
            {
                category = 'Elektronik',
                coords = { 
                    vector3(-90.7388, 31.6161, 71.9545),
                },
            },
        }
    },
    {
        name = 'Apotek',
        logo = 'https://r2.fivemanage.com/pN3z1DHpADRyEEFI0VgPv/images__1_-removebg-preview.png',
        blipSprite = 623,
        blipColor = 0,
        blipscale = 1.2,
        coords = { 
            vector3(98.3954, -227.4731, 54.6637),
            vector3(-489.5796, -1016.4704, 24.2895),
        },
        cashierCoords = {
            vector3(93.4112, -230.0641, 54.6637),
            vector3(-487.6127, -1012.6375, 24.2893),
        },
        varor = {
            {
                category = 'Läkemedel',
                coords = { 
                    vector3(92.5560, -227.5941, 54.6637),
                    vector3(97.3668, -230.1080, 54.6637),
                    vector3(-483.7739, -1021.4051, 24.2892),
                },
            },
        }
    },
    {
        name = 'Systembolaget',
        logo = 'https://r2.fivemanage.com/pN3z1DHpADRyEEFI0VgPv/Systembolaget_logo__new_.svg-removebg-preview.png',
        blipSprite = 149,
        blipColor = 0,
        blipscale = 0.9,
        coords = { 
            -- vector3(1138.7067, -979.5815, 46.4158),
            -- vector3(-1488.1503, -383.0480, 40.1634),
            vector3(-815.9755, -807.6337, 20.4767),
        },
        cashierCoords = {
            -- vector3(1135.6469, -982.3151, 46.4158),
            -- vector3(-1487.1730, -379.0961, 40.1634),
            vector3(-814.7943, -803.2599, 20.4767),
        },
        varor = {
            {
                category = 'Sprit',
                coords = { 
                    -- vector3(1136.9663, -978.7840, 46.4158),
                    -- vector3(-1486.3290, -382.7535, 40.1634),
                    vector3(-807.7605, -800.5057, 20.4767),
                    vector3(-808.3567, -811.2130, 20.4767),
                    vector3(-809.6588, -806.1526, 20.4767),
                    vector3(-813.0443, -790.2439, 20.4767),
                },
            },
        }
    },
}
