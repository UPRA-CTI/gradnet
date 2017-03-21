<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/pace-theme-flash.min.css',
        'css/animate.min.css',
        'css/jquery.scrollbar.css',
        'css/webarch.css',
        'css/site.css',
    ];
    public $js = [
        'js/pace.min.js',
        'js/bootstrap.min.js',
        'js/jqueryblockui.min.js',
        'js/jquery.unveil.min.js',
        'js/jquery.scrollbar.min.js',
        'js/jquery.animateNumbers.min.js',
        'js/jquery.validate.min.js',
        'js/select2.min.js',
        'js/webarch.js'
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
