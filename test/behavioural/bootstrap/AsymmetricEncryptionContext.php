<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;

use ParagonIE\Halite\Asymmetric;
use Sodium\hex2bin;

class AsymmetricEncryptionContext implements Context, SnippetAcceptingContext
{
    protected $ownPrivateKey;
    
    protected $ownPublicKey;
    
    protected $otherPartyPrivateKey;
    
    protected $otherPartyPublicKey;
    
    protected $clearText;
    
    protected $cipherText;
    
    /**
     * @Given My private key is :arg1
     */
    public function myPrivateKeyIs($privateKey)
    {
        $this->ownPrivateKey = new Asymmetric\EncryptionSecretKey(hex2bin($privateKey));
    }
    
    /**
     * @Given I have my public key
     */
    public function iHaveMyPublicKey()
    {
        $this->ownPublicKey = $this->ownPrivateKey->derivePublicKey();
    }

    /**
     * @Given The other party's private key is :arg1
     */
    public function theOtherPartysPrivateKeyIs($privateKey)
    {
        $this->otherPartyPrivateKey = new Asymmetric\EncryptionSecretKey(hex2bin($privateKey));
    }
    
    /**
     * @Given I have the other party's public key
     */
    public function iHaveTheOtherPartysPublicKey()
    {
        $this->otherPartyPublicKey = $this->otherPartyPrivateKey->derivePublicKey();
    }

    /**
     * @Given I have a cleartext message of :arg1
     */
    public function iHaveACleartextMessageOf($clearText)
    {
        $this->clearText = $clearText;
    }
    
    /**
     * @Given I have a ciphertext message of:
     */
    public function iHaveACiphertextMessageOf(PyStringNode $cipherText)
    {
        $this->cipherText = str_replace(["\n", " "], '', (string) $cipherText);
    }

    /**
     * @When I encrypt my authenticated message
     */
    public function iEncryptMyAuthenticatedMessage()
    {
        $cipherText = Asymmetric\Crypto::encrypt(
            $this->clearText,
            $this->ownPrivateKey,
            $this->otherPartyPublicKey
        );
        
        $this->cipherText = $cipherText;
    }
    
    /**
     * @When I decrypt my authenticated message
     */
    public function iDecryptMyAuthenticatedMessage()
    {
        $clearText = Asymmetric\Crypto::decrypt(
            $this->cipherText,
            $this->ownPrivateKey,
            $this->otherPartyPublicKey
        );
        
        $this->clearText = $clearText;
    }

    /**
     * @Then The resulting cleartext is :arg1
     */
    public function theResultingCleartextIs($clearText)
    {
        if($this->clearText !== $clearText) {
            throw new \UnexpectedValueException('Resulting cleartext is not as expected');
        }
    }
    
    /**
     * @Then The resulting ciphertext is valid
     */
    public function theResultingCiphertextIsValid()
    {
        throw new PendingException();
    }
}
