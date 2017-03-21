<?php

use yii\base\Component;
use yii\authclient\OAuth2;
use app\models\User;

/**
 *
 */
class LinkedInClient extends Component
{
    const HTTP_GET = 'GET';
    const HTTP_PUT = 'PUT';
    const HTTP_POST = 'POST';

    private $_client;

    private $_user; //app\models\user;

    protected function getClient()
    {
        return  Yii::$app->authClientCollection->getClient('linkedin');
    }

    /**
    *
    */
    public function getUser($email = NULL)
    {
        if ($email != NULL) {
            // find user to add to external service:
            $this->_user = User::find()->andWhere(['email' => $email])->one();
        }

        return $this;
    }

    /**
    *
    */
    public function GerProfileData()
    {
        $this->_client = $this->getClient();

        $this->_user = $this->getUser();


    }

    /**
    *
    */
    protected function ExecuteRequest($url = "", $data = [], $http_verb = self::HTTP_GET)
    {
        if ($this->_client !== null) {
            $response = $client->createApiRequest()
                ->setMethod($http_verb)
                ->setUrl($url)
                ->setData($data)
                ->send();

            if ($response->statusCode != 404) {
                throw new \Exception('Not Found');
            }

            if (!$response->isOk) {
                throw new \Exception('Not Found');
            }

            return $response;
        }
    }
}
