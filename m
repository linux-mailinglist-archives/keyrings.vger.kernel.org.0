Return-Path: <keyrings+bounces-2962-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92967B21AB1
	for <lists+keyrings@lfdr.de>; Tue, 12 Aug 2025 04:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10A9190448B
	for <lists+keyrings@lfdr.de>; Tue, 12 Aug 2025 02:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF642D8365;
	Tue, 12 Aug 2025 02:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="pOPDSKVq"
X-Original-To: keyrings@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438612D8360;
	Tue, 12 Aug 2025 02:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754965414; cv=none; b=oPUeLtS6TcP0UeT8+HIPI5XfJYDIrdtlIj/CfnTTBEsnUe7c68YnkjWv4eCadw2UkMI40QGSB3ouZWcYX0yIc6DXxJcaXMvpurqEXCy+znU7rtj3xpSp6LDYIfWxYIfp4ndP/H9vpP4JVch/OIF1XSdpL6AY9qanB6AU6jy0FbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754965414; c=relaxed/simple;
	bh=Ax6Uhc3qLzylWS5kLL+3ZT8+f+9TDQRzOxpw1VsAfok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=rdg7UmwduSSIZn3nrkcEfhWH4xKGklxMNa81vfBbbqdwa41jWFBValCoqdy+US1nsKqBOzy/YmxiafAb4YZsjIs0iq4rxEf16FAi+ehP4w+PujjiQIywI6IQwT6hJPVg1yEDHNxcQVWa99D48aNqpyMStzhTOxZZ5G9qovOqh2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=pOPDSKVq reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=BVUXRsORzW4SYPAiFIeRfq+CdwNYjTNsXLBN3LyluQY=; b=p
	OPDSKVqJ431+tOXo4TuKektVnuxLyDESMmQ8y9XwfhqUWmwSXf2z0K3LuCiycjQW
	Ct89lUbiu1et8YJanhGCJ/lqMWCAfTIO3wB6AHtzePN/mg0wqy2O2ifvvBUFESRC
	rGf3zIjEkpar5HHV6l3694jUIY6jgVZS62RA4eKRPM=
Received: from bigclouds$163.com ( [114.247.186.99] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Tue, 12 Aug 2025 10:22:52 +0800
 (CST)
Date: Tue, 12 Aug 2025 10:22:52 +0800 (CST)
From: "longguang.yue" <bigclouds@163.com>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: "Nicolas Schier" <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
	"David Howells" <dhowells@redhat.com>,
	"David Woodhouse" <dwmw2@infradead.org>, keyrings@vger.kernel.org
Subject: Re:Re: [PATCH] Makefile: mrproper deletes signing_key.x509
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250811191408.GA169691@ax162>
References: <20250809120405.22957-1-bigclouds@163.com>
 <aJerjQGmXXcpTtBB@fjasle.eu>
 <1ac1d3e3.58ad.19897d159ff.Coremail.bigclouds@163.com>
 <20250811-diligent-rigorous-ara-e7a9d2@l-nschier-aarch64>
 <20250811191408.GA169691@ax162>
X-NTES-SC: AL_Qu2eBvWdukss5CGdY+kfmksTj+c+W8ayu/ku245WNp9wjD/p9QQ+UnRSMFvNze60Ag6MmgmGYBZK0s1RcqVbb4MTTcD/FC1R+g6aGLhcZ8qkZg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <787c311e.22c0.1989c166d01.Coremail.bigclouds@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dSgvCgD3j5d8pZpo09MXAA--.35898W
X-CM-SenderInfo: peljuzprxg2qqrwthudrp/1tbiNg+mQ2iaULJhMQAIsU
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDI1LTA4LTEyIDAzOjE0OjA4LCAiTmF0aGFuIENoYW5jZWxsb3IiIDxuYXRoYW5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj5PbiBNb24sIEF1ZyAxMSwgMjAyNSBhdCAwMzo1OToyM1BNICswMjAw
LCBOaWNvbGFzIFNjaGllciB3cm90ZToKPj4gQ2M6IGNlcnRzLyBwZW9wbGUKPj4gCj4+IFtyZS1v
cmRlcmVkIHF1b3RlXQo+PiBPbiBNb24sIEF1ZyAxMSwgMjAyNSBhdCAwMjoyODo1NlBNICswODAw
LCBsb25nZ3VhbmcueXVlIHdyb3RlOgo+PiA+IEF0IDIwMjUtMDgtMTAgMDQ6MTE6NTcsICJOaWNv
bGFzIFNjaGllciIgPG5pY29sYXMuc2NoaWVyQGxpbnV4LmRldj4gd3JvdGU6Cj4+ID4gPiBPbiBT
YXQsIEF1ZyAwOSwgMjAyNSBhdCAwODowNDowNVBNICswODAwIGxvbmdndWFuZy55dWUgd3JvdGU6
Cj4+ID4gPiA+IGRlbGV0ZXMgdGVtcG9yYXJ5IHNpZ25pbmdfa2V5Lng1MDkgYW5kIHJlc2VydmVz
IHVzZXItZGVmaW5lZCB4NTA5LmdlbmtleQo+PiA+ID4gCj4+ID4gPiBjYW4geW91IGVsYWJvcmF0
ZSB0aGUgYWN0dWFsIHByb2JsZW0gd2l0aCBzb21lIG1vcmUgZGV0YWlscz8KPj4gPiA+IAo+PiA+
ID4gY2VydHMvc2lnbmluZ19rZXkueDUwOSBpcyByZW1vdmVkIGR1cmluZyAnbWFrZSBjbGVhbicg
d2hpY2ggaXMgYSBkZXBlbmRlbmN5Cj4+ID4gPiBvZiAnbXJwcm9wZXInLgo+PiA+ID4gCj4+ID4g
PiAnbXJwcm9wZXInIGlzIG1lYW50IHRvIHJlbW92ZSBldmVyeXRoaW5nIHRoYXQgbWlnaHQgaW5m
bHVlbmNlIGEgc3Vic2VxdWVudAo+PiA+ID4gY2FsbCBvZiBrYnVpbGQgZm9yIHRoZSBzYW5lIGFy
Y2hpdGVjdHVyZS4KPj4gPiA+IAo+PiA+ID4gV2l0aG91dCBmdXJ0aGVyIGRldGFpbHMgSSBjYW5u
b3Qgc2VlIGFueSBwcm9ibGVtIGhlcmUuCj4+ID4gPiAKPj4gPiA+IEtpbmQgcmVnYXJkcywKPj4g
PiA+IE5pY29sYXMKPj4gWy4uLl0KPj4gPiAKPj4gPiAgIEl0IHNob3VsZCBub3QgZGVsZXRlIHg1
MDkuZ2Vua2V5IGJlY2F1c2Ugb2YgaXRzIGV4c2l0ZW5jZSBpbiBnaXRpZ25vcmUuCj4+ID4gTm9y
bWFsbHksIHVzZXJzIHdhbnQgdG8ga2VlcCAgYSBzZWxmLWRlZmluZWQgeDUwOS5nZW5rZXksICBi
dXQgbXJwcm9wZXIgZGVsZXRlcyBpdCwgb25seSBkZWZhdWx0X3g1MDkuZ2Vua2V5IGlzIGVmZmVj
dGl2ZS4gCj4+ID4gQWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaCwgdXNlcnMganVzdCBuZWVkIHRv
IGNvcHkgc2VsZi1kZWZpbmVkIHg1MDkuZ2Vua2V5IGludG8gY2VydHMgZGlyZWN0b3J5IG9uY2Uu
Cj4+IAo+PiAnbWFrZSBtcnByb3BlcicgaXMgbWVhbnQgdG8gcHJlcGFyZSB0aGUgc291cmNlIHRy
ZWUgdG8gYmUgYXMgcHJpc3RpbmUgYXMgCj4+IHBvc3NpYmxlIGZvciB0aGUgZ2l2ZW4gYXJjaGl0
ZWN0dXJlLiAgVGhpcyBpbmNsdWRlcyByZW1vdmFsIG9mIGFueSAKPj4gY29uZmlndXJhdGlvbiBm
aWxlKHMpIHRoYXQgaW5mbHVlbmNlIHN1YnNlcXVlbnQgYnVpbGRzLiAgRnJvbSBrYnVpbGQgCj4+
IHBvaW50IG9mIHZpZXcsIGNlcnRzL3g1MDkuZ2Vua2V5IGlzIGFsc28gYSBraW5kIG9mIGEgY29u
ZmlndXJhdGlvbiBmaWxlLCAKPj4gYXMgbGVhdmluZyBpdCBpbiB0cmVlIGFmdGVyIG1ycHJvcGVy
IGNyZWF0ZXMgZGlmZmVyZW50IGJ1aWxkIHJlc3VsdHMgCj4+IGNvbXBhcmVkIHRvIGEgYnVpbGQg
ZnJvbSBhIHJlYWxseSBwcmlzdGluZSBzb3VyY2UgdHJlZS4KPgo+QWdyZWVkLCBJIHRoaW5rIGl0
IGlzIGludGVudGlvbmFsIHRoYXQgdGhpcyBpcyBpbiBtcnByb3BlciBhbmQgbm90Cj5jbGVhbiwg
c28gSSBkb24ndCB0aGluayB3ZSBjYW4gYWNjZXB0IHRoaXMgY2hhbmdlIGFzIGlzLCBidXQgSSBh
bSBoYXBweQo+dG8gYmUgdG9sZCBvdGhlcndpc2UgZnJvbSB0aGUgY2VydHMgbWFpbnRhaW5lcnMu
Cj4KPj4gSWZmIHRoZSBjZXJ0cy8gbWFpbnRhaW5lcnMgdGhpbmsgdGhhdCByZXRhaW5pbmcgYSB1
c2VyIHg1MDkuZ2Vua2V5IGZpbGUgCj4+IG92ZXIgYSBtcnByb3BlciBtYWtlcyBzZW5zZSwgdGhl
biB3ZSBzaG91bGQgcHJvYmFibHkgYWRqdXN0IHRoZSBydWxlIGZvciAKPj4gZ2VuZXJhdGluZyAk
KG9ianRyZWUpL2NlcnRzL3g1MDkuZ2Vua2V5LCBlLmcuIGJ5IGFsbG93aW5nIHRvIHByb3ZpZGUg
b25lIAo+PiBieSBlbnZpcm9ubWVudCB2YXJpYWJsZS4KPj4gCj4+IERhdmlkIG9yIERhdmlkLCBk
byB5b3UgaGF2ZSBhbiBvcGluaW9uIG9uIHRoaXM/Cj4KPkZ1cnRoZXJtb3JlLCBpZiB0aGUgdXNl
ciB3YW50ZWQgdG8gdXNlIGEgcHJlZGVmaW5lZCB4NTA5IGNvbmZpZ3VyYXRpb24sCj53aHkgY2Fu
J3QgdGhleSBnZW5lcmF0ZSB0aGVpciBvd24gc2lnbmluZyBrZXkgYW5kIHByb3ZpZGUgaXQgdmlh
Cj5DT05GSUdfTU9EVUxFX1NJR19LRVksIGluc3RlYWQgb2YgaGlqYWNraW5nIHRoZSBkZWZhdWx0
IGxvZ2ljIG9mCj5jZXJ0cy9zaWduaW5nX2tleS5wZW0/IEJhc2VkIG9uIG15IHJlYWRpbmcgb2Yg
Y2VydHMvTWFrZWZpbGUsIGl0IHNvdW5kcwo+bGlrZSB0aGUgZGVmYXVsdCBsb2dpYyBpcyBtb3N0
bHkgdGhlcmUganVzdCBmb3IgYWxseWVzY29uZmlnIG9yCj5yYW5kY29uZmlnLgo+Cj5DaGVlcnMs
Cj5OYXRoYW4KCk9rLCBJdCBuZWVkcyB0byBjb3B5IHg1MDkuZ2Vua2V5IHRvIGNlcnRzIGFmdGVy
IG1ycHJvcGVyLgoKQXMgYWJvdmUsIHNpZ25pbmdfa2V5Lng1MDkgc2hvdWxkIGJlIGRlbGV0ZWQs
IGl0IGRlbnBlbmRzIG9uIHg1MDkuZ2Vua2V5IGFuZCBpcyBhIGNvbmZpZ3VyYXRpb24gZmlsZS4g
CkFkanVzdCB0aGlzIGZpeCB0byBkZWxldGUgc2lnbmluZ19rZXkueDUwOSBvbmx5LCBpcyBpdCBh
Y2NlcHRhYmxlPwoKVGhhbmtzLgo=

