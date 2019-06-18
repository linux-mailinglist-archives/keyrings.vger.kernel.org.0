Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D93A4A084
	for <lists+keyrings@lfdr.de>; Tue, 18 Jun 2019 14:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfFRMO7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Jun 2019 08:14:59 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:34639 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRMO7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 Jun 2019 08:14:59 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MCayD-1hmruM030N-009keq; Tue, 18 Jun 2019 14:14:33 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Marcel Holtmann <marcel@holtmann.org>,
        Denis Kenzior <denkenz@gmail.com>,
        James Morris <james.morris@microsoft.com>,
        keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: asymmetric_keys - select CRYPTO_HASH where needed
Date:   Tue, 18 Jun 2019 14:13:47 +0200
Message-Id: <20190618121400.4016776-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FdNmaZTGrGzDq5iXrgxkPwJziSsaX6wvGAloE87LV9MtQDdOYXc
 A3JSH9MjAAV9AVPVTkgEg3wZiN++IzPZwFidXTmQjnffLTlpVEQktDnr6W00YY1L1/SZg6s
 KuL2d8GXhB1u446diVQJ5V9W+fSQsRwWh6qOR+gy51zvLcbueux+r08i7qUIXrrozbQ3zhF
 nZJuGoVzRXgPZQ8+1gVyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:plixockunwQ=:XD/SdUpYN61LItUSwWLGyM
 nZ9JlxNTFHA3vpsy6AIRTuM1083mhqgExjNPm6EB1VH2qZxBuaggtLv57LQMcCgEVbmGkJIkL
 PVjZlpipfvmN19QL+uYZI3J8Ebk+nzyhTiSRM7vYtyAhwdK8QyQ4jQDNpUouwG60lJs1yIIk0
 /ghNfhpO8L19bzX1C1EIJtfbLDZlAhx3eWo5PQRjKiHjtAVT9s2fA6HTHcFZ7P742/t6TqHXp
 +T03CgCw5xs+itQoAdV3sHyhM44Cl6p+4cj/frHPa737y2H9WdriW6CwXbquFRgPiBiEFMt8n
 YvDMkskHBjG2r8KKgSOMf3z1EilxxizY8ml3vayEgAncwM49ZFasDXITbRCrla9ch7bSiQixw
 rlgKmh0zNi6GEAHdhAOlBhzH2Rz2xUcuawxn++2+Jaxm4LoCDKeoGaDnJb+bfWZD8vDsg4XiU
 +JFQSKG1CBb+Ys/1o721HpHaSLjALWsFhSrO0mwdpiH0EhDkh3py18tFu0u56JsEHh/lmj8rj
 mRCJ3N8CNzVMBQ+sT5ulAoHF5mDWiYp/DfVNohsGnhNb4gW/gMBHv3eeoh204cUmdj7lANo5G
 WFlxG3ORxHRw7atPsTzk2UFbg5Nwjqlqnm4Q81z6nRjig5IwRm0Z4rtj+Cx0vgar1ye9wknp4
 TZUhchcK2AQDcMyHNx2yK3+NWDmbYKXrJaVmtkNr3hFUlBV27TXO7sIMF4jzSQAJ34JX0LX/i
 uG2AflvgH5hisO4KPt5V3ePfbRR4f2iQk1JXQg==
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Build testing with some core crypto options disabled revealed
a few modules that are missing CRYPTO_HASH:

crypto/asymmetric_keys/x509_public_key.o: In function `x509_get_sig_params':
x509_public_key.c:(.text+0x4c7): undefined reference to `crypto_alloc_shash'
x509_public_key.c:(.text+0x5e5): undefined reference to `crypto_shash_digest'
crypto/asymmetric_keys/pkcs7_verify.o: In function `pkcs7_digest.isra.0':
pkcs7_verify.c:(.text+0xab): undefined reference to `crypto_alloc_shash'
pkcs7_verify.c:(.text+0x1b2): undefined reference to `crypto_shash_digest'
pkcs7_verify.c:(.text+0x3c1): undefined reference to `crypto_shash_update'
pkcs7_verify.c:(.text+0x411): undefined reference to `crypto_shash_finup'

This normally doesn't show up in randconfig tests because there is
a large number of other options that select CRYPTO_HASH.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 crypto/asymmetric_keys/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index be70ca6c85d3..1f1f004dc757 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -15,6 +15,7 @@ config ASYMMETRIC_PUBLIC_KEY_SUBTYPE
 	select MPILIB
 	select CRYPTO_HASH_INFO
 	select CRYPTO_AKCIPHER
+	select CRYPTO_HASH
 	help
 	  This option provides support for asymmetric public key type handling.
 	  If signature generation and/or verification are to be used,
@@ -65,6 +66,7 @@ config TPM_KEY_PARSER
 config PKCS7_MESSAGE_PARSER
 	tristate "PKCS#7 message parser"
 	depends on X509_CERTIFICATE_PARSER
+	select CRYPTO_HASH
 	select ASN1
 	select OID_REGISTRY
 	help
@@ -87,6 +89,7 @@ config SIGNED_PE_FILE_VERIFICATION
 	bool "Support for PE file signature verification"
 	depends on PKCS7_MESSAGE_PARSER=y
 	depends on SYSTEM_DATA_VERIFICATION
+	select CRYPTO_HASH
 	select ASN1
 	select OID_REGISTRY
 	help
-- 
2.20.0

