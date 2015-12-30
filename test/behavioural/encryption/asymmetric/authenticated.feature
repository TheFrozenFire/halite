Feature: authenticated
    In order to securely converse with another known party
    I need to be able to encrypt and decrypt messages
    And these encrypted message need to be accessible only by the recipient
    And these encrypted messages need to verifiably come from the sender
    
    Background:
        Given My private key is "1e5404d1a0daa68c8f99d8efdce2eef9c5e34563ece9541c5222b4ebe9f29811"
        And The other party's private key is "17933bcf50deb802e460e8394d8a8875f890b3d993c1afba43e801aa1b0afe60"
    
    Scenario: Encrypt an authenticated message
        Given I have a cleartext message of "Sed nec eleifend urna. Donec sed cursus nisl. Duis at mollis arcu, vitae gravida sem. Mauris mollis nibh ac lobortis feugiat."
        And I have the other party's public key
        When I encrypt my authenticated message
        Then The resulting ciphertext is valid
    
    Scenario: Decrypt an authenticated message
        Given I have a ciphertext message of:
            """
            3142010002dc3816dea24fdc0d1e71977c5408006b8a8e0b01addadbc650fb14106d
            159486886990303e783c609cb73f9259bbd61786ceb77ed45f0b28e48c26f0f78042
            2b25ddf98c12d05186f38238478e99fe83c2b70476ceb195f239d711ae606d329b1a
            ec18407bdaef4dc79b89d6956dc713f28860074319654c86618859c9d33e2eae5d7e
            f4aa9b70f79e163ee9af3fa70c86921bd70a827c9c76cfd0b0769aec99bdc40aa232
            06bc9d9b61d21594213fd1b3ec7dbe6dd3c28ef80bd9344d9ca783356f77312ecbab
            6c868555b5c46e689a708fad74bec8d957755d1fe0fdaeface1112fc005a4243
            """
        And I have the other party's public key
        When I decrypt my authenticated message
        Then The resulting cleartext is "Aliquam maximus suscipit dui id ultrices. Suspendisse malesuada quis nunc sed feugiat. Fusce nisl leo, mattis at blandit et, tristique ac massa."
