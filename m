Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEA2309878
	for <lists+keyrings@lfdr.de>; Sat, 30 Jan 2021 22:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhA3V1V (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 30 Jan 2021 16:27:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:55484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231690AbhA3V1V (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sat, 30 Jan 2021 16:27:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8DDB60234;
        Sat, 30 Jan 2021 21:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612042000;
        bh=bw/P+2VsfMk32PiR9DYyk44JSGogJ5Ltc51M+OxLiUM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=G4SinYpxrXAcFvEqWLeIc3DBnYXKx4K8g9W+ygN+Y285NYKHPBWSpNMFEeHHc3Nl0
         sBnrggsDpngu4vPPPhrfDy+yZEeiP0thHBtz0QXHELMq5KVV6U91bdc1Az6hSVC1aa
         B1r249FN2D2le+nEAnDUkmI1VXwcn790OSUXb+VUY24Via7C9t6+KigVfMiLDsMR8m
         hyK6TvHuNPZv7W2ZKGl9LGt+HMUDu6SZx3DFr3arayuU7bZzyCc9xMP5dUHelhpCJ6
         Jfxf5pS+oTVM2rrIehhdEPShq2ALYHBfajI+KoA3nYpi0c5jVtEFSRk4PBv7rBcPW9
         Pz10Jw5ua6h2A==
Message-ID: <689c44925d60238181390e775b52809e89e0b26a.camel@kernel.org>
Subject: Re: [PATCH v3 1/3] x509: Detect sm2 keys by their parameters OID
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Stefan Berger <stefanb@linux.vnet.ibm.com>, dhowells@redhat.com,
        keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Date:   Sat, 30 Jan 2021 23:26:35 +0200
In-Reply-To: <20210127123350.817593-2-stefanb@linux.vnet.ibm.com>
References: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
         <20210127123350.817593-2-stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

T24gV2VkLCAyMDIxLTAxLTI3IGF0IDA3OjMzIC0wNTAwLCBTdGVmYW4gQmVyZ2VyIHdyb3RlOgo+
IEZyb206IFN0ZWZhbiBCZXJnZXIgPHN0ZWZhbmJAbGludXguaWJtLmNvbT4KPiAKPiBEZXRlY3Qg
d2hldGhlciBhIGtleSBpcyBhbiBzbTIgdHlwZSBvZiBrZXkgYnkgaXRzIE9JRCBpbiB0aGUgcGFy
YW1ldGVycwo+IGFycmF5IHJhdGhlciB0aGFuIGFzc3VtaW5nIHRoYXQgZXZlcnl0aGluZyB1bmRl
ciBPSURfaWRfZWNQdWJsaWNLZXkKPiBpcyBzbTIsIHdoaWNoIGlzIG5vdCB0aGUgY2FzZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gQmVyZ2VyIDxzdGVmYW5iQGxpbnV4LmlibS5jb20+Cj4g
LS0tCj4gwqBjcnlwdG8vYXN5bW1ldHJpY19rZXlzL3g1MDlfY2VydF9wYXJzZXIuYyB8IDEzICsr
KysrKysrKysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NyeXB0by9hc3ltbWV0cmljX2tleXMveDUwOV9jZXJ0
X3BhcnNlci5jIGIvY3J5cHRvL2FzeW1tZXRyaWNfa2V5cy94NTA5X2NlcnRfcGFyc2VyLmMKPiBp
bmRleCA1MmM5YjQ1NWZjN2QuLjQ2NDNmZTVlZDY5YSAxMDA2NDQKPiAtLS0gYS9jcnlwdG8vYXN5
bW1ldHJpY19rZXlzL3g1MDlfY2VydF9wYXJzZXIuYwo+ICsrKyBiL2NyeXB0by9hc3ltbWV0cmlj
X2tleXMveDUwOV9jZXJ0X3BhcnNlci5jCj4gQEAgLTQ1OSw2ICs0NTksNyBAQCBpbnQgeDUwOV9l
eHRyYWN0X2tleV9kYXRhKHZvaWQgKmNvbnRleHQsIHNpemVfdCBoZHJsZW4sCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgdm9pZCAqdmFs
dWUsIHNpemVfdCB2bGVuKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeDUwOV9wYXJz
ZV9jb250ZXh0ICpjdHggPSBjb250ZXh0Owo+ICvCoMKgwqDCoMKgwqDCoGVudW0gT0lEIG9pZDsK
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBjdHgtPmtleV9hbGdvID0gY3R4LT5sYXN0X29pZDsKPiDC
oMKgwqDCoMKgwqDCoMKgc3dpdGNoIChjdHgtPmxhc3Rfb2lkKSB7Cj4gQEAgLTQ3MCw3ICs0NzEs
MTcgQEAgaW50IHg1MDlfZXh0cmFjdF9rZXlfZGF0YSh2b2lkICpjb250ZXh0LCBzaXplX3QgaGRy
bGVuLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY3R4LT5jZXJ0LT5wdWItPnBr
ZXlfYWxnbyA9ICJlY3Jkc2EiOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJl
YWs7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgT0lEX2lkX2VjUHVibGljS2V5Ogo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjdHgtPmNlcnQtPnB1Yi0+cGtleV9hbGdvID0gInNtMiI7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChjdHgtPnBhcmFtc19zaXplIDwg
MikKCkVpdGhlciBhIG5hbWVkIGNvbnN0YW50LCBvciBhdCBsZWFzdCBhIGNvbW1lbnQgaW5zdGVh
ZCBvZiBqdXN0ICcyJy4KCgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuIC1FTk9QS0c7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBvaWQgPSBsb29rX3VwX09JRChjdHgtPnBhcmFtcyArIDIsIGN0eC0+cGFyYW1zX3NpemUg
LSAyKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3dpdGNoIChvaWQpIHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSBPSURfc20yOgo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY3R4LT5jZXJ0LT5wdWItPnBrZXlf
YWxnbyA9ICJzbTIiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRlZmF1bHQ6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVO
T1BLRzsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoGRlZmF1bHQ6Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT1BLRzsKCi9KYXJra28K

