<?php
if (!YII_ENV_DEV) {
    $config = parse_ini_file(dirname(dirname(__DIR__)). '/gradnet-config.ini', true);
} else {
    $config = parse_ini_file(dirname(dirname(__DIR__)). '/gradnet-config.ini', true);
}

return [
    'class' => 'yii\authclient\Collection',
    'clients' => [
        'linkedin' => [
            'class' => 'yii\authclient\clients\LinkedIn',
            'clientId' => $config['linkedinclientid'],
            'clientSecret' => $config['linkedinsecret'],
        ],
    ]
];
