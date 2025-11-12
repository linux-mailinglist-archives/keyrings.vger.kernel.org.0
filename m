Return-Path: <keyrings+bounces-3331-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 305D4C52965
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 15:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 229CD4E5E57
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 13:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE97222587;
	Wed, 12 Nov 2025 13:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NhjKngH4"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6514021FF46
	for <keyrings@vger.kernel.org>; Wed, 12 Nov 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955490; cv=none; b=DHlKPkcTdcsMQ6ChMlRFa/JClh79e1LItbjAC29BM+ds3XQMlkO6Zc3za6304v/1yS7f6kXa6kuLUb6SSxUgG+Mt0W4zeL6tvHU6YHsui0DkvOrsiOIQw7S/Y0dELMWAHDEg7BbBiPxtqYzjUr3NsQt/fKXjtbU7CB6BKwEjGxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955490; c=relaxed/simple;
	bh=n3z9Jw7bEHMAgnOiDe5IhWMfzXL5QaG73RaPQ8hsiRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prss4knQf8l+F6mui1LUNbdm7eDv8lL6sefXpRTHaZKC2EW6OFcgmPtdZRHQogruDhM8Ch0925H8R81tZUED5xsSSPD5nLYTlMlg1HXdxJ9Pa5a9jw/M8v/tiLoSr0v72FHbUIQi71YhTer1Ka4xWQwdwht+pdvAlSRGvGstGJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NhjKngH4; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3c2db014easo157688466b.0
        for <keyrings@vger.kernel.org>; Wed, 12 Nov 2025 05:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762955487; x=1763560287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6eiNlO9W/s4a9ATMZ+5tC2gxgF5OkwPuLSe2qOti34o=;
        b=NhjKngH4QwqCocKpnN5eT4FBJ1deZrwJaqsRkjprC3UrH7Pm2iiJ8OuKw6oQOe4sA1
         Q3WByqVtQt7KVx75osmvuakFUVSR5vx+oqsMRfjW3q6jyEKmjQ34bEPT1UOX9mh/MPf9
         M5TXQoKN5A6l+HbxJ9us9XDK4Pr0B7MkYCRlewNkckKUnTE2GKBa1PYq3hsjRUanGkdP
         SVhhDtty4vlCPeqLM79OQM4qauB4zJJQmic/5w93FYrHF6ye7rtQ+gjMfxbTnTevS8NO
         nqUlGOhLMvXYqYYcAkJ3bJFQuOLsDKengXD6h5PVppnfhX203LclBqRHr9zvdapRyFar
         CGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955487; x=1763560287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eiNlO9W/s4a9ATMZ+5tC2gxgF5OkwPuLSe2qOti34o=;
        b=fmCl2z1qWVCq4AchK4Nr2ZgVNq9IomXdWygySMUgLntcAouAINAPgH30RV/mqNLpQx
         xfK5VJhYWcmWVHdWDqZhfCDc2m7fetCCCSKQmUbN0vV2swwWrB49qovjHKrbqOhZFIax
         ycA44uZVWOhIYLfLLvzBYtvc8dldiLJbeZxr95z9LJxObCtiuEFB+EgkoJAICiw3cJDH
         trNNAHENzEs4sEekCwnNKx1IhLd4+X5DlCZBe39myqNah+kPYKl1SwhdwpG18sLh4jJk
         JrcRJCxAnuU2qP2u1dFmYjPT17FzTDEits1uHk264ZbdbxIf9NeuahugZXXZm/xec9ru
         NLBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFFTThvfKu4hBfM2fpqC8d4RN2JeU5gJ6xSNGIdRRA3ayyWZU1xhIA8eBt1ThJJbMozP9NlN6GoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+x4Y5wNGKISlakgC+nJk6AJM6fbhoUspddTe3dTPSDndx5bm
	KuSOV3Fn/maocRo/9HChIJFeJmgxD+JSd0Pe9l8KX8cCIRg6LOBIP1jWphjiK/47YGc=
X-Gm-Gg: ASbGncvRZEsLgyBdSqcNtbHL3xZnNNRzJxG+OhNAmrUHNTw3ntdIOT/p30KgWIREMmL
	3jvctaF/WQR+67KqYGuSmMYim529AQov4ELfuF+qCprrygSEIhH4O4qwq9XK8d7/CB9wL3lBxxw
	4ibjqSLd/zjJ1FoSLxUOw9QoJLxCrRkqScx3UgJ2RjpYsAC1VFVAVpvpwGa6ilZrUe92+DAEzbi
	sZGjNEXMP7iFpueWxFLZdMnANMIRBA9Nxhvjg7Hq7xvYtYKIeHuf6g4cqvkw8nWS2Kze4+JosKM
	r7OmX2IGwsdIIgiII7JDh/LR1HJJWOoUXrjckOl96RnWNEa9PRHXRS74GI1i4H+Ba4O9JXrgTPy
	oi+9uFBDh018G54ZAWAJrYL0/EHfU3Wzq2kY9fypH5UTPp8JrS+lts6q6uX6Jv2JEUIJQLHFMqu
	/f5To5ft3ATJQyQhALD68BpiNjW5a7Lp+KVfMl1PB3q2K7HDBEk8kj5pZpDdEOuENhrKPapGCS1
	l8LrRnWu3SLED0rQlaEE8sIRsEpuK+kF/abnI1Nh5bOE8c=
X-Google-Smtp-Source: AGHT+IGh4KgZmhD9Tv0Q7r99njOC0g5Ef0gAEOLC9RYQ++zh2fc2FZ85E0tUpZs0DA8Ec4kM3FudQA==
X-Received: by 2002:a17:907:1c0a:b0:b39:57ab:ec18 with SMTP id a640c23a62f3a-b7331a9aa6fmr284237266b.45.1762955486563;
        Wed, 12 Nov 2025 05:51:26 -0800 (PST)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9be184sm1587077766b.56.2025.11.12.05.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 05:51:26 -0800 (PST)
Message-ID: <e624c242-b297-4bb7-a76a-cbb18b027472@suse.com>
Date: Wed, 12 Nov 2025 14:51:24 +0100
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sign-file: Remove support for signing with PKCS#7
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: David Howells <dhowells@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, keyrings@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251111154923.978181-1-petr.pavlu@suse.com>
 <20251111154923.978181-3-petr.pavlu@suse.com>
 <922480ff44bda3b6ecfda1ae780c659644560f94.camel@HansenPartnership.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <922480ff44bda3b6ecfda1ae780c659644560f94.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/25 5:53 PM, James Bottomley wrote:
> On Tue, 2025-11-11 at 16:48 +0100, Petr Pavlu wrote:
>> The PKCS#7 code in sign-file allows for signing only with SHA-1.
>> Since SHA-1 support for module signing has been removed, drop PKCS#7
>> support in favor of using only CMS.
> 
> The change log is a bit alarmist.  CMS really *is* PKCS7 and most
> literature will refer to CMS as PKCS7.  What you're really deprecating
> is the use of the PKCS7_sign() API which can only produce SHA-1
> Signatures ... openssl is fully capable of producing any hash PKCS7
> signatures using a different PKCS7_... API set but the CMS_... API is
> newer.
> 
> The point being the module signature type is still set to PKEY_ID_PKCS7
> so it doesn't square with the commit log saying "drop PKCS#7 support".
> What you really mean is only use the openssl CMS_... API for producing
> PKCS7 signatures.

Ok, I plan to update the description to the following in v2:

sign-file: Use only the OpenSSL CMS API for signing

The USE_PKCS7 code in sign-file utilizes PKCS7_sign(), which allows signing
only with SHA-1. Since SHA-1 support for module signing has been removed,
drop the use of the OpenSSL PKCS7 API by the tool in favor of using only
the newer CMS API.

The use of the PKCS7 API is selected by the following:

 #if defined(LIBRESSL_VERSION_NUMBER) || \
 	OPENSSL_VERSION_NUMBER < 0x10000000L || \
 	defined(OPENSSL_NO_CMS)
 #define USE_PKCS7
 #endif

Looking at the individual ifdefs:

* LIBRESSL_VERSION_NUMBER: LibreSSL added the CMS API implementation from
  OpenSSL in 3.1.0, making the ifdef no longer relevant. This version was
  released on April 8, 2020.

* OPENSSL_VERSION_NUMBER < 0x10000000L: OpenSSL 1.0.0 was released on March
  29, 2010. Supporting earlier versions should no longer be necessary. The
  file Documentation/process/changes.rst already states that at least
  version 1.0.0 is required to build the kernel.

* OPENSSL_NO_CMS: OpenSSL can be configured with "no-cms" to disable CMS
  support. In this case, sign-file will no longer be usable. The CMS API
  support is now required.

In practice, since distributions now typically sign modules with SHA-2, for
which sign-file already required CMS API support, removing the USE_PKCS7
code shouldn't cause any issues.

-- 
Thanks,
Petr

