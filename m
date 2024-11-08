Return-Path: <keyrings+bounces-2289-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC239C1EA1
	for <lists+keyrings@lfdr.de>; Fri,  8 Nov 2024 14:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D071B21D31
	for <lists+keyrings@lfdr.de>; Fri,  8 Nov 2024 13:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CC41F5FA;
	Fri,  8 Nov 2024 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="I4SB0kMs"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C1137E
	for <keyrings@vger.kernel.org>; Fri,  8 Nov 2024 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731074136; cv=none; b=AqCmZNWrAfsVAt+P8OXEn/8L5Sh8DlN7jUOUnjYNMsa8ECBwkqCJl8YNgQvYSmLPhnxJw8++qgsFASU1u8ViM/75J5a6XHJ/URTrehobAoXpso8sQX6M22ncDlfMOcA/DHJbcyNcd9NuA+2y6MznMJAjNfW+ll0vIt555nkxxYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731074136; c=relaxed/simple;
	bh=PI5kDSKgOH8B7psfIBJ1IE8jGD7i/7s0kGfeImFBKTQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=jn3ZECgetb58pXsVN9XYy445KjeFDDzUj02XaKOTmlqH9u9UoWDK3Q/HFYsdBXE9SpQl9kPyue14z8+wK/0qgkvKqVOvQ/ZF3A+YcCDvjf/fFn19crI9hBOK7mBJ2DVRdsQ+IKYdtPNhsbSzzlkD7tWbGL1+RicAvI626xP0HeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=I4SB0kMs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so1229776f8f.1
        for <keyrings@vger.kernel.org>; Fri, 08 Nov 2024 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1731074133; x=1731678933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bdDwzNP8Gq3D3Rb3pq3U1GPQk53PzEsGA0T6+gaF9k=;
        b=I4SB0kMs5M5tN0vZ7EaitdAdMZORsbzWo6yJYTUC6OdsPYcOl8uvqHZVSMUBDeTL3+
         voXsfEikc2CYIY1oeFGakesjkY7FBixpStHt65B5Dm6/bXRnrcXFYwMTGJh2fHUe8YJh
         ejdUr4szeuYAIDXnPGYfC4zwnhD/HUUPo004wwe2Kh7RiTE5R+4wwOp3YPgcXRqjUiED
         lujVuotklEqkDFtrMrH6K1cP6mMfgGj7zHDD8aYmXvhsgaISCNWpP+IOUydVUCS/y8HO
         K5blnwYvi+QKXdjsjwiTloN2Kne1sNrHDEbpG8yPw0cRFveawsL/v8+beOKzUeX0HgiR
         UmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074133; x=1731678933;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bdDwzNP8Gq3D3Rb3pq3U1GPQk53PzEsGA0T6+gaF9k=;
        b=p/OXvY6HWKMKbbprSokh4IO4Yx5lQUD4qUpbpY84nDD7a0PTUiBBE0HdvsESd1unOL
         jdKGmfjwD1LCr1gt0pIqYoPU8SlUSDghiQf/8rA2MlzO4L+PWgpUAqoMlMU6l0CSvouK
         UNxk4G+pu2koUO45OK/Vc4OS4k6ATNVNeaAnx6rCEee7fJUMh5/PhWbzDsxnGcX503NU
         VeXKtl0/bgvmqT/fozKbxXgzY2pCDkp1affuOAzgIUS3eZfOa+VTxqRBmRoClcOgenqU
         zf1z9anRlBrpxTGbuHsit+thhvzhZ+y4vI+a1wR+4A8OWMdnXDPaF4pdclfFBuihRqaG
         AoRA==
X-Forwarded-Encrypted: i=1; AJvYcCU7DHHGySzaRWnrhc8h5qEeqokRlrIDkW3ELGPBXiK7R2Af3JAA/5fOv5RKbcTWraaz2Pnl6ioY2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy877oddmkFtrBW4ODbEz4tds+w/zANd202rS8V9a75HIwgu3Eh
	DG9WJ6kKlKtZskT6a39K25a9NDFeGEPmvJtITG8hQ3ezfAwPFkDl
X-Google-Smtp-Source: AGHT+IEDtKsbvWffVihDxk2HeTt6TnW5z4ZhqAf86AMR/Wzz20Li5IDFGcgooR4f2NoojKEnQVlITg==
X-Received: by 2002:a5d:5849:0:b0:37c:d57d:71cd with SMTP id ffacd0b85a97d-381f188c777mr2069844f8f.52.1731074132923;
        Fri, 08 Nov 2024 05:55:32 -0800 (PST)
Received: from ?IPV6:2001:a61:241a:f601:8f8b:f13c:fa:de9a? ([2001:a61:241a:f601:8f8b:f13c:fa:de9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432a368780dsm85920285e9.1.2024.11.08.05.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 05:55:32 -0800 (PST)
From: bauen1 <j2468h@googlemail.com>
X-Google-Original-From: bauen1 <j2468h@gmail.com>
Message-ID: <80bfd97c-e0e7-4259-ab21-3f207e93b2a6@gmail.com>
Date: Fri, 8 Nov 2024 14:55:31 +0100
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reading public key portion of asymmetric keys
To: James Prestwood <prestwoj@gmail.com>, keyrings@vger.kernel.org
References: <eb52cc47-0e42-4f1a-984d-27d3470da92e@gmail.com>
Content-Language: en-US
In-Reply-To: <eb52cc47-0e42-4f1a-984d-27d3470da92e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I just wanted to chime in, that I would also be interested in this.

On 9/30/24 8:40 PM, James Prestwood wrote:
> Unless I'm missing something it does not seem possible to read back the public key portion of an asymmetric key to userspace once added to the kernel.

I haven't found a way to do so either, in some cases (x509 ?) the fingerprint (of the subject identifier ?) might be displayed in /proc/keys, but not the public key for an asymmetric key loaded into the keyring.

> I have a use case where two separate applications need to perform crypto operations using the same private/public key pair and for added security it would be convenient to add the key (or load from TPM) once and pass around a key ID rather than the keys themselves.

My use case is loading a key into the keyring (tpm, stored on disk or generated ad-hook - shouldn't matter) as part of a request-key program, and giving only this key back to the application.
The application can then request a certificate in a separate request_key operation.
As a result, the application itself never has access to the raw key material, but gets a usable asymmetric key along with a certificate.

Now ideally I would need the following things:

- Verify that the key the application is requesting a certificate for is genuine. I.e. hasn't been loaded by the application itself.
- Read the public key from a loaded key to sign a certificate for it.
- Ideally some existing integration, e.g. an openssl provider to utilize the key with the pkey_* operations. Unfortunately I haven't found any, if there are, I'd love to know about them :)

Currently I work around this by having a keyring under the root user keyring, where I link every generated/loaded key, so I can later check that it is in fact a genuine key.
Additionally I store the public key, encoded as OpenSSH key, in the description of the key.
It's not amazing, but it works as a proof of concept and doesn't require any modifications to the kernel.

> One of the things I need is to create and sign a CSR. To create the CSR I need the public key contents which can't be obtained from the key ID.

For pretty much this exact purpose.

> 
> To solve this problem I would propose adding a "read" operation to the asymmetric key type, but limiting it to only reading the public key portion of the key (if it exists). Alternatively a entirely new "read_public" keyctl API could be added as well, but re-using the existing read seemed more straight forward. Adding this seems easy enough, but I wanted to get an idea if this is something that would be accepted upstream or if others had better suggestions.

I don't really have any input for the API, but it might be worth considering if the ability to read out the public key of an asymmetric key would benefit or hurt some of the existing users.
Currently you require access to a key to perform the pkey_verify operation, potentially triggering an LSM or audit log (?), but if you allow reading out the public key, you could e.g. check a bunch of files against a trusted key without triggering e.g. audit logs for these verify operations.

Unfortunately I'm not sure if I'll have the time to implement a proof of concept patch, but I would certainly be willing to help test one.

Thanks.

-- 
bauen1

