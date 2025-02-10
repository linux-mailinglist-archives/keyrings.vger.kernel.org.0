Return-Path: <keyrings+bounces-2391-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD8FA2E5B2
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 08:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD536161D83
	for <lists+keyrings@lfdr.de>; Mon, 10 Feb 2025 07:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81681B4149;
	Mon, 10 Feb 2025 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="oUT7751o"
X-Original-To: keyrings@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4772F22;
	Mon, 10 Feb 2025 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173580; cv=none; b=Zjr/9U/m/N4xSngyvcn6uv2VdpqZlWEImG3pYAZ3E2FOpmAO+pbA3HoY9iKSixU2VRTdkIsfMWwghKKe8jjgTAZ/FC311dpjP2ezrmEIcXLFl03ps97tMU0H052jD6OKHz7PYcGa1Im/kr56UoJSndrBSA2TkylB3gj2LBkMXwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173580; c=relaxed/simple;
	bh=bu3265nkmcJSYlrHDqDFK7MSOGGoqIlgIbM/1bDZnls=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=h1W58XW53LxJZoZUMYRPeGn8NLRNPKaP3+ZNeasAm0OnYGyE1pybrCpz2U+KW8o+7uWZcJcw20rNOmh9n3omQPob1Iy7/ZKuGCIsAbSx8xT219zZltXUot2xs98raZpdHTK0KOqO+w4BCO0c80XWibaqiILHBUOfFo6DP9eqTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=oUT7751o; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1739173457;
	bh=C6HrSCHeGOHMoGlGPpydSXRgpBdO5hVao1L0NYTTobQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=oUT7751oDzvlBmNuq9Cn+2KObYBajNJrhT4bSbIsEsuvIXdBcLkKnqDr056VyyOA8
	 t+rt+d+u77Jwr7zw+1QaRfI9cmnOIV4uhyNovosjxdFxGUlGg1iTXKpzzpEfjB0slq
	 bb3YBKDcJ3gOoYU0+pes001MQuB5X71OovwVegP4=
X-QQ-mid: bizesmtpip2t1739173452tw85ddj
X-QQ-Originating-IP: 3sf1PNF+5TXBxtJghdEtbv4inUE+dqtC8qXEwLIw5cY=
Received: from [IPV6:240e:668:120a::253:10f] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Feb 2025 15:44:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13952041749841670231
Message-ID: <C3CEFBAC7B40E0C0+54a25d09-813c-4a59-b4c6-ebcb347e6768@uniontech.com>
Date: Mon, 10 Feb 2025 15:44:10 +0800
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Subject: [Bug Report] The command rsautl was deprecated in version 3.0. Use
 'pkeyutl' instead.
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
To: dhowells@redhat.com, dwmw2@infradead.org
Cc: keyrings@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?6ZmI6bqf6L2p?= <chenlinxuan@uniontech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3QiyH5fieHoczab5bqIggy42"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N13sSk57c6bEwosIMbBT62YU2ept31a+dkdDcuTMiY4j6AeiQhDtohI7
	lcwpQy6bxvvc+Y/MIoKdl1h1Bf/osRV9Cgt1LCFOIr7WxHLAnaOqFImytne0qtH0P32UH4C
	o+UW2UbozoI7SsDKVMIJjFqXEPvxImDVK6jEuac71hN5qeBBktzlKuTGf1YtVEiPOzeRUn9
	X+nBU8PSfyseWklEC3TL4F/I18WeTH+2QYGuOnT9duz86pMAbMxKIM8CfxHCi/XthsTA3di
	asSl0eKfyROBIRH97AYCl1UQZXq4hamrFeXZ8fQWB6vRN5iqXQHli358MBGVNeINeWyy6bf
	tiYICxdtah+JMjf4FCmt8/V14K+ahzO9ra49/roK8rAsQ8+nxDusxG6TsCSvhHMnOeh8EtP
	JUYtxM1k83Wm8JO4gCQWffRRVax0tgoNiEy392xvSr0aW1CXWvEPfvXdUdmeGLR5ukgQoRH
	884rMGvvI0QaXFzy6HcapMQMy5tGY5Pa91rpdUUL+adjPcN7Y/42dRs7YztFjiNgVNE5+MW
	LCBAZQjf3X6Z4fsRCbUy7Y0NgUd2XjJor/rZ6uSl4rFRR+RFgtft6EUOfqjilyG9XzXRbeE
	fYQA/odUJRRxzF0WvDDpD9rhfHnnCIKwJCOSotbzg45HNnqJVmYIXcnYiFV4P9hVekvLeNt
	PJzhT+BXxLJGHqPrdT4Tg72i2U2R0PLP3i5TE2rOpFLHojCUc44OEt9v9/WdS/R6lutid3a
	O2vjIozAgaqacs3xgS8EqHOb/KyDWRkGcvci59gmf9Q342ALbJb0ZHGHypTLJvDIgpH496m
	u1AIWTfDyY0KMVqlYxk36M606uV5x7lpzwQmxzF49XVyKxPWvC27cK2J06qovTvz92IxZYY
	qOSuXWV7yYHnaBW8l1w1UQQa3PQ9Vrz/sNnbYNgzP7ZtBGY2/78YlO3vMDmk/nJ0i2NBAeP
	7H6AfYRIkmX0lkarn54DhRfbjCOdetJ/2aU6hJp0v3t0jXfsFQFudhpL3JPQPfprXtyCku/
	5v+NERMw7IWgeC7k6T
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3QiyH5fieHoczab5bqIggy42
Content-Type: multipart/mixed; boundary="------------0Y0DYtlS0PsGPjgfri9FkxK0";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
To: dhowells@redhat.com, dwmw2@infradead.org
Cc: keyrings@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?6ZmI6bqf6L2p?= <chenlinxuan@uniontech.com>
Message-ID: <54a25d09-813c-4a59-b4c6-ebcb347e6768@uniontech.com>
Subject: [Bug Report] The command rsautl was deprecated in version 3.0. Use
 'pkeyutl' instead.

--------------0Y0DYtlS0PsGPjgfri9FkxK0
Content-Type: multipart/mixed; boundary="------------UOy4oLjg58FdkG9Z83pG6nBL"

--------------UOy4oLjg58FdkG9Z83pG6nBL
Content-Type: multipart/alternative;
 boundary="------------BUw0FLGBrKHrCJpCaipelEsN"

--------------BUw0FLGBrKHrCJpCaipelEsN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpXaGVuIGNvbXBpbGluZyBrZXJuZWwgb24gRGViaWFuIHNpZCwgZ2V0dGlu
ZyB0aGVzZSB3YXJuaW5nczoNCg0KIMKgwqDCoCAjIFNJR04gDQogwqDCoMKgZGViaWFuL2xp
bnV4LWltYWdlLTYuMTQuMC1yYzItMDAwMDgtZzBlNzMzMmRhM2QxNi9saWIvbW9kdWxlcy82
LjE0LjAtcmMyLTAwMDA4LWcwZTczMzJkYTNkMTYva2VybmVsL25ldC92bQ0KIMKgwqDCoCB3
X3Zzb2NrL3Zzb2NrX2xvb3BiYWNrLmtvIC0gZHVlIHRvIHRhcmdldCBtaXNzaW5nDQouL3Nj
cmlwdHMvc2lnbi1maWxlIHNoYTUxMiAiY2VydHMvc2lnbmluZ19rZXkucGVtIiANCi4vY2Vy
dHMvc2lnbmluZ19rZXkueDUwOSBkZWJpYW4vbGludXgtaW1hZ2UtNi4xNC4wLXJjMi0wMDAw
OC1nMA0KZTczMzJkYTNkMTYvbGliL21vZHVsZXMvNi4xNC4wLXJjMi0wMDAwOC1nMGU3MzMy
ZGEzZDE2L2tlcm5lbC9uZXQvdm13X3Zzb2NrL3Zzb2NrX2xvb3BiYWNrLmtvIA0KDQogwqDC
oMKgIFRoZSBjb21tYW5kIHJzYXV0bCB3YXMgZGVwcmVjYXRlZCBpbiB2ZXJzaW9uIDMuMC5U
aGUgY29tbWFuZCByc2F1dGwgDQp3YXMgZGVwcmVjYXRlZCBpbiB2ZXJzaW9uIDMuMC4gVXNl
ICdwa2V5dXRsJyBpbnMNCiDCoMKgwqAgdGVhZC4gVXNlICdwa2V5dXRsJyBpbnN0ZWFkLg0K
DQogwqDCoMKgIFRoZSBjb21tYW5kIHJzYXV0bCB3YXMgZGVwcmVjYXRlZCBpbiB2ZXJzaW9u
IDMuMC4gVXNlICdwa2V5dXRsJyANCmluc3RlYWQuDQogwqDCoMKgIFRoZSBjb21tYW5kIHJz
YXV0bCB3YXMgZGVwcmVjYXRlZCBpbiB2ZXJzaW9uIDMuMC4gVXNlICdwa2V5dXRsJyANCmlu
c3RlYWQuDQogwqDCoMKgIFRoZSBjb21tYW5kIHJzYXV0bCB3YXMgZGVwcmVjYXRlZCBpbiB2
ZXJzaW9uIDMuMC4gVXNlICdwa2V5dXRsJyANCmluc3RlYWQuDQogwqDCoMKgIFRoZSBjb21t
YW5kIHJzYXV0bCB3YXMgZGVwcmVjYXRlZCBpbiB2ZXJzaW9uIDMuMC4gVXNlICdwa2V5dXRs
JyANCmluc3RlYWQuDQogwqDCoMKgIFRoZSBjb21tYW5kIHJzYXV0bCB3YXMgZGVwcmVjYXRl
ZCBpbiB2ZXJzaW9uIDMuMC4gVXNlICdwa2V5dXRsJyANCmluc3RlYWQuDQogwqDCoMKgIFRo
ZSBjb21tYW5kIHJzYXV0bCB3YXMgZGVwcmVjYXRlZCBpbiB2ZXJzaW9uIDMuMC4gVXNlICdw
a2V5dXRsJyANCmluc3RlYWQuDQogwqDCoMKgIFRoZSBjb21tYW5kIHJzYXV0bCB3YXMgZGVw
cmVjYXRlZCBpbiB2ZXJzaW9uIDMuMC4gVXNlICdwa2V5dXRsJyANCmluc3RlYWQuDQogwqDC
oMKgICMgU0lHTiANCiDCoMKgwqBkZWJpYW4vbGludXgtaW1hZ2UtNi4xNC4wLXJjMi0wMDAw
OC1nMGU3MzMyZGEzZDE2L2xpYi9tb2R1bGVzLzYuMTQuMC1yYzItMDAwMDgtZzBlNzMzMmRh
M2QxNi9rZXJuZWwvbmV0L2hzDQogwqDCoMKgIHIvaHNyLmtvIC0gZHVlIHRvIHRhcmdldCBt
aXNzaW5nDQouL3NjcmlwdHMvc2lnbi1maWxlIHNoYTUxMiAiY2VydHMvc2lnbmluZ19rZXku
cGVtIiANCi4vY2VydHMvc2lnbmluZ19rZXkueDUwOSBkZWJpYW4vbGludXgtaW1hZ2UtNi4x
NC4wLXJjMi0wMDAwOC1nMA0KZTczMzJkYTNkMTYvbGliL21vZHVsZXMvNi4xNC4wLXJjMi0w
MDAwOC1nMGU3MzMyZGEzZDE2L2tlcm5lbC9uZXQvaHNyL2hzci5rbyANCg0KIMKgwqDCoCBU
aGUgY29tbWFuZCByc2F1dGwgd2FzIGRlcHJlY2F0ZWQgaW4gdmVyc2lvbiAzLjAuIFVzZSAn
cGtleXV0bCcgDQppbnN0ZWFkLg0KIMKgwqDCoCBUaGUgY29tbWFuZCByc2F1dGwgd2FzIGRl
cHJlY2F0ZWQgaW4gdmVyc2lvbiAzLjAuVGhlIGNvbW1hbmQgcnNhdXRsIA0Kd2FzIGRlcHJl
Y2F0ZWQgaW4gdmVyc2lvbiAzLjAuIFVzZSAncGtleXV0bCcgaW5zDQogwqDCoMKgIHRlYWQu
IFVzZSAncGtleXV0bCcgaW5zdGVhZC4NCg0KIMKgwqDCoCBUaGUgY29tbWFuZCByc2F1dGwg
d2FzIGRlcHJlY2F0ZWQgaW4gdmVyc2lvbiAzLjAuIFVzZSAncGtleXV0bCcgDQppbnN0ZWFk
Lg0KDQpJIGNhbid0IGZpbmQgZGlyZWN0IG9wZW5zc2wtcnNhdXRsIGNhbGxzIGluIGtlcm5l
bCBjb2RlLiBOb3Qgc3VyZSBpZiANCml0J3MgaW1wbGljaXRseSBjYWxsZWQgaW4ga2VybmVs
IG9yIGZyb20gYnVpbGQgdG9vbHMgY2F1c2luZyB0aGUgDQp3YXJuaW5nLiBSZXBvcnRpbmcg
YXMgbWlub3IgYnVnIGp1c3QgaW4gY2FzZS4NCg0KVGhhbmtzLA0KDQotLSANCldhbmdZdWxp
DQo=
--------------BUw0FLGBrKHrCJpCaipelEsN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi all,</p>
    <p>When compiling kernel on Debian sid, getting these warnings:<br>
    </p>
    <p><span style=3D"font-family:monospace"><span
          style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=A0=C2=
=A0 # SIGN
=C2=A0=C2=A0=C2=A0debian/linux-image-6.14.0-rc2-00008-g0e7332da3d16/lib/m=
odules/6.14.0-rc2-00008-g0e7332da3d16/kernel/net/vm</span><br>
        =C2=A0=C2=A0=C2=A0 w_vsock/vsock_loopback.ko - due to target miss=
ing<span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;"> =C2=A0=C2=
=A0 =C2=A0
          ./scripts/sign-file sha512 "certs/signing_key.pem"
          ./certs/signing_key.x509
          debian/linux-image-6.14.0-rc2-00008-g0</span><br>
        =C2=A0=C2=A0=C2=A0
e7332da3d16/lib/modules/6.14.0-rc2-00008-g0e7332da3d16/kernel/net/vmw_vso=
ck/vsock_loopback.ko
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0</s=
pan><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0.The command
          rsautl was deprecated in version 3.0. Use 'pkeyutl' ins</span><=
br>
        =C2=A0=C2=A0=C2=A0 tead. Use 'pkeyutl' instead.<span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        =C2=A0=C2=A0=C2=A0 <br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0. Use 'pkeyutl'
          instead.</span><span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0. Use 'pkeyutl'
          instead.</span><span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0. Use 'pkeyutl'
          instead.</span><span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0. Use 'pkeyutl'
          instead.</span><span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0. Use 'pkeyutl'
          instead.</span><span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0. Use 'pkeyutl'
          instead.</span><span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0. Use 'pkeyutl'
          instead.</span><span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 # SIGN
=C2=A0=C2=A0=C2=A0debian/linux-image-6.14.0-rc2-00008-g0e7332da3d16/lib/m=
odules/6.14.0-rc2-00008-g0e7332da3d16/kernel/net/hs</span><br>
        =C2=A0=C2=A0=C2=A0 r/hsr.ko - due to target missing<span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;"> =C2=A0=C2=
=A0 =C2=A0
          ./scripts/sign-file sha512 "certs/signing_key.pem"
          ./certs/signing_key.x509
          debian/linux-image-6.14.0-rc2-00008-g0</span><br>
        =C2=A0=C2=A0=C2=A0
e7332da3d16/lib/modules/6.14.0-rc2-00008-g0e7332da3d16/kernel/net/hsr/hsr=
=2Eko
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0</s=
pan><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0. Use 'pkeyutl'
          instead.</span><span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0.The command
          rsautl was deprecated in version 3.0. Use 'pkeyutl' ins</span><=
br>
        =C2=A0=C2=A0=C2=A0 tead. Use 'pkeyutl' instead.<span
          style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
        <br>
        <span style=3D"color:#000000;background-color:#ffffff;">=C2=A0=C2=
=A0=C2=A0 The
          command rsautl was deprecated in version 3.0. Use 'pkeyutl'
          instead.</span><br>
        <span style=3D"color:#000000;background-color:#ffffff;">
        </span><br>
      </span>I can't find direct openssl-rsautl calls in kernel code.
      Not sure if it's implicitly called in kernel or from build tools
      causing the warning. Reporting as minor bug just in case.<br>
    </p>
    <p>Thanks,<br>
    </p>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      WangYuli</div>
  </body>
</html>

--------------BUw0FLGBrKHrCJpCaipelEsN--

--------------UOy4oLjg58FdkG9Z83pG6nBL
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------UOy4oLjg58FdkG9Z83pG6nBL--

--------------0Y0DYtlS0PsGPjgfri9FkxK0--

--------------3QiyH5fieHoczab5bqIggy42
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ6muSgUDAAAAAAAKCRDF2h8wRvQL7gHt
AP47k4A7o45vEujw3ZrNql8YMz8MpLlefHujxiawnNuGUAEA8fFWoYf9vuvLtCQbxphSDAUViHcs
R1471buEkei+WQk=
=uIBs
-----END PGP SIGNATURE-----

--------------3QiyH5fieHoczab5bqIggy42--


