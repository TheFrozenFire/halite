Feature: authenticated
    In order to securely converse with another known party
    I need to be able to encrypt and decrypt messages
    And these encrypted message need to be accessible only by the recipient
    And these encrypted messages need to verifiably come from the sender
    
    Background:
        Given My private key is:
            """
            -----BEGIN RSA PRIVATE KEY-----
            MIIEogIBAAKCAQEAkMtyJPZzMaJSdFNi44Iu4mniLb7k5fVRT+wTPLwDR4/Gng3G
            gPduzfX4EiA23nLmDK1LwiLlBdyvMRjAaZCMEtxLFqdJGH9qp3Msh9BUN6bSF7eJ
            /X8aGosqAa4WdxDpzrK8Up9rDFDImpGxtB4w8XQy7Pk1TGGZBtLhDVz2Cuj2qczJ
            p7I0I4ADALn3QEn2jfzzZ/zeXrprYKO50/6uClyracjHC5VRaTAvFzWinpckEotS
            FnF20Uu0G0fAdfmNOOiinMBPzdyJ7+dyO2aTjtPetV8hOvsq2WBE5mWK561+x74O
            gUXa9JWrlzTlg7XUNdXSjNzNHZ1SEplbNJygZQIDAQABAoIBAAnXKczFSxLme0AY
            orHfmRweIhcF0DyorXwHCU+pX3evl8oKGaGOL2OkAdYJhnEb0fKunGV3RaVeWDG4
            AuupvTtS6W+Csv8NOcxjkXUxfWfC2Khv+trVloqTRqmSkUhKR/maQB5FY1sU6m1G
            1ZLuMllWkld0oGCuiV3jWxQzay1WiZsIidgg//WQaSiMUTU5I7FkhWjP8hkwMXyF
            /1QpoLk0VQUZVbh9jDPeKqx7K0WQwHk6QouJt8kci7lBimK9Tx73q57CxD63qHcK
            rL64mwv6Zel9VCCiSRBOm8CzyI8LEf08fCma1YqFiZp+inmAg841df+lyddBkLOo
            cNf8vYECgYEA0P8WGHcXJBPV2V3h7fXJ+x8MGvxdompEo663HvJSuq0xvE3USjnV
            EeOVsvtpwpunANNLD4M4UP/nZdjJWg7GUV8TyOFx9BD/HayNGZBNv+KYXWxdj0hi
            +cOOKk9/4Q7+75rrg9ofF6atJtNEDaM3EPg5zTuNPHpXysfIhpoCXNUCgYEAsVv2
            cMclOyLXLsD93quAC2GYDkGzh0x/SEk7WzA+lF1zr7Ab3ooP/E7dWzHgWdG8ovX7
            4E1RGMfU6Vev9xzX2rMpbAq3XhEEGBPP1ya1Z+2sKkW3VSPFRUhrN7ZOUCK7msSI
            bnv8n9IoMf9c9U1p4YvvPBYfUG8d/LQpbigEvVECgYA1kLt8B8HhmEfeD0bhs3ZS
            K5HxtK7W+r+e6B+9CcSUXeF6bsQzRgFLNXZfyjpAC57RAlahojMj54LKQrbQoyrH
            HkQ23zlSoayRUXFUlPyoao48m5KbL6VWeH2OcJPI/gvvI1irkZMYf7qvUcSGbkel
            zMkbxeCcGIs5yNynSv/CBQKBgHNYebfy7DW/fO69ON4d71J3kCqFdDqj94uNhPrT
            L3/SHzC9egKLC8Zti+yJTX1cuC/Lhpnj7sANBl0TWC+AJKnpJyFK/uJAcsct61fj
            pssGeZesa4UFlIBwjrpW6CuZyyTmeExSeoN+bAHIMC6gwCGdnmMXiBoJihkVGnS3
            tg1hAoGAPgjdLFHeYvXdVXRnKTBt0PCc1uwuh2Y+KW+oxNO+QYri+211lHYnHMbv
            8mbhDslTvVF+MuC8od5L9w+qx6KVYMLqD58seR7W6EVkxiuw7T5zhJI/ZVpAkPZt
            W6Q5TgAL2XIRAYqtA9Qk36q+Ouboqm7mN7IrU+gvwayCfP0bgGg=
            -----END RSA PRIVATE KEY-----
            """
        And The other party's private key is:
            """
            -----BEGIN RSA PRIVATE KEY-----
            MIIEpAIBAAKCAQEAtc7M3Bv7Cw1W4X+GH7iY8jOjUhGg5QTfYLJfkQ++f2Dl+UXX
            n8Iy5TnDw4HBB3fa5BqRvog57vu9uxBh4rwzielfw7h5Wa6BlAXZ2Su685Jt8zgU
            SkGt9HEgke5rblfJDfdkHpZzJrksO1nlvRbP5fyRJkrPw9ZNjKbZbUOAy22ygeKw
            32yFSCT5xvB6MNxuD/qu/vUNU19HNyH4ZCuPi6Ra35GpykTRH2TfLk0vMEtC+KV/
            1BpbGrzOQ2iAoKoBYBHNM2KI5W7EtA/oJ7mUyn/KQXqoOxkE1Wc/YdTVUCNRrvKA
            E3zuq4dMDP9SJPlzS0mqsNY2Qf9BXrU0X0HITQIDAQABAoIBAANvMqN9y9I7oEaG
            OCxlOk5o907XkmiBHQ8gj3mYCIszc2SwExCrhHacDrykuNbBRttEPTiSLjX7f2wH
            NTIpR/f09qAl3fT5vOzk52aY0uFDBNyxVIDKmNSjRnA7RsBA3EVtRPDm+qnimZlN
            a2+U/LxldwB4LVCPvctIY5cSzV4KXkwkqvgaTHxS73z2dYRCShYnF7DGdm989msk
            SZ8QQRJG+1zoyR3PAo4CmjaFQJC05uXT0EP1T9lVZdScmpDl8hdVhpjUaG6EVXD7
            h3RCpV2ch7zOGCzUPrvhdlbmC90tsGFbvfT7Fidb2/xF5bByNpAUHYDW6JVtLIGg
            8wbVNCkCgYEA2lalnfCLnRZ1fRKL94rDgjJGF8idrj/cIdFB2YLslRmwDWiqA/cE
            1QsT2WZq2jUK/o3JdXWEJzxalEfnaYXM1w+e1poCNwiki/PO0z8s4+etoAcy28iM
            dYKTkq4HpOPPkpnchBwjNl2T9jlHJZ24GMPPwURpsrQd3p0EYVHjRcsCgYEA1SsJ
            +YvF5zz4ulkBJ4PPpeGY6fQjbLv1uW891+FFkUnTtHdJqJjpD05kACwUJkGrDNki
            vef6vXRAfJC2nGCmyHJw6OC3Un+UDXetwqbFbWu79373xuFMi/0tX7Qio/g00ePY
            gPyC16TMLoKvFUwiinFqsjikdxPtZKiTU03Wp0cCgYEAoWVdhbOzsIpSjQLxvimw
            PgTltV0R2iXQlpr131Cdi9XyQuc0jjvCMa2/nXvMzsJY/zRWUGJvLwW5O1UvpdxH
            QE6GrsInkwDriZzPLW7MwyeWO+42VSsZUSAV8F5+vg+8d/UOggW+rchcwK00f4Tn
            +j58y7PDolrsnYtaGoqKwyMCgYEAtB45v3IrNsh+IncyUoE945xL6OMxS59Gcflc
            +ByQ+8K177cbtin+Q8CpHrwgCnNSZPjUMkLhy1N/acGdi2TfiF+qqBu4yyyhnP+T
            AvaHu31cxjOyiYm1dFPpEwTSgFopx3AOcG7s3+mP3XzvE7/RL8nFrfHOhg+Ad505
            XxpWVeECgYB0iezR71P1otdE7pLg2iTjQOf/R2xiBq0Og4l3CNnDw8eSCUBKgHdx
            ZzC4mVkzQhd+ph7Kr0K7ZGBcjVRbKnVvrgMqcJ48qDtRpWJfYOG0CVoElOgxDM9J
            SOAdTipge11G77P84pgSvamGMEZHcCLKwe0yObNZ74PXldGW8n1DUg==
            -----END RSA PRIVATE KEY-----
            """
    
    Scenario: Encrypt an authenticated message
        Given I have a cleartext message of "Sed nec eleifend urna. Donec sed cursus nisl. Duis at mollis arcu, vitae gravida sem. Mauris mollis nibh ac lobortis feugiat."
        And I have the other party's public key
        When I encrypt my authenticated message
        Then The resulting ciphertext is valid
    
    Scenario: Decrypt an authenticated message
        Given I have a ciphertext message of ""
        When I decrypt my authenticated message
        Then The resulting cleartext is "Aliquam maximus suscipit dui id ultrices. Suspendisse malesuada quis nunc sed feugiat. Fusce nisl leo, mattis at blandit et, tristique ac massa."
