Return-Path: <keyrings+bounces-2173-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9998AC41
	for <lists+keyrings@lfdr.de>; Mon, 30 Sep 2024 20:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43E201F236AE
	for <lists+keyrings@lfdr.de>; Mon, 30 Sep 2024 18:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBED814A627;
	Mon, 30 Sep 2024 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1Du3j3b"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF9E192D82
	for <keyrings@vger.kernel.org>; Mon, 30 Sep 2024 18:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727721645; cv=none; b=TE/hdTwkjOgaolCYRkXjJKlGDrMnl2RWpuwrGtjPt4S5aCo8G++y7lw+MyKDlgyAkT2hG+1SrTj8J5axKY54fn1+jeYByPo9uQEp1/SXGvLaQjMhL0HrKjIUBCkyBcT/Gg8kvgOPR3PA/lV1Saa41pUX0qppfoCZEBHJJcGTCqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727721645; c=relaxed/simple;
	bh=2ZPv0d9hUJBt5qKwF3chbIqNRfMUt9xoKYhnbX3yhKA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=NL5OGD00UFWhn6jIabnkyf5MkthdHHjUw3NhFGwCaMusB1d9OdG7Ka3A02OCMK9JM1J8MaIyPO1ccGOx0HD5d8s0tV7vPTi875WLMsohOLaScFU93ObTyhbfL1swLzO0GJvqXDzX05UfICeBf9f8t0XgDJ7/o6rbHmWnD1rSREA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1Du3j3b; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20b49ee353cso30222895ad.2
        for <keyrings@vger.kernel.org>; Mon, 30 Sep 2024 11:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727721643; x=1728326443; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndFJwW9UnSWvmGWAz2ns3q0fd/gfNg3V4vZtjUGxW68=;
        b=d1Du3j3bHUpWrURpDSKVcO1FhqUz+o997DNF5JLSV4344IFjCyEA3POsURF3WsXFzM
         hU9+VERaASg1gW6SCBddOoupt+YBkWtL5OR6OoWrhzDMcPjqNNxEJdpjaPX/G/+tv7+7
         9Ld/D79r8Sh8/iLdSBXnlchaCYREfdvnCCK8HaGA/e86t1YVg4XVJ477LsGkR0iYb8+u
         FwfLqDHsyH4/9KnSYwBbmPC4S30vlyl+HIFF4Yf+/nVQKd6cxUzghEWjdcLsLQWt1X8O
         cwAbJhsE9vbMGsmnbuZ4zqPAAX1IIa9EV0berhXsdRXJpg6OUA5L8t8i+U5VdtagE8wt
         gDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727721643; x=1728326443;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ndFJwW9UnSWvmGWAz2ns3q0fd/gfNg3V4vZtjUGxW68=;
        b=rjJ60MBlG6OptJo1TQTZcxQN9wQZaPvgQt3RW0xx4BIzBosMxJr/gz2VO7JRotsSiO
         X/6qUQIJRPu7MK6+pN767UXHsa4ojvaiDtjRibbHfTQ4R3xJ5nUFP8qBYdvCYITAA6x2
         Ky+6VBUZGdDXaFugHJcHBxtED9PhY4CLx55uT8P+CBfTjEYxit8WcVcdsPAdODTsuXjC
         WFM6WW6E69yWrTye0CJ5h2UGga0pNm4G4nB2KWiHcgzRt7RTZ/a3Wv7wA68zunldyNm5
         Ad1cUNHCWkMwp4fFEukYXKkBqF4yyWNmFPeWcknvL9vQTncwKyvhhN8D+/+6x8aKbXJH
         lzJw==
X-Gm-Message-State: AOJu0Yzr7ob8Ouo2jjxd0ZwhgxP2l7XRFRxiIvVZlxQVCAj/xppBNEyy
	aV6XO3OXQHTVpmUXz//ygg1HJtQv1VGf6yfmyKgKqdiq9JpZNuLZy5QVWQ==
X-Google-Smtp-Source: AGHT+IEMv6Ctj+a+K8VGyJigC1eT1RfbQA8igUsSa11UPbqhkkUqtSXB/j0fUC3VsUEVOsT7L0yisQ==
X-Received: by 2002:a17:90a:de92:b0:2e0:d1fa:fdd7 with SMTP id 98e67ed59e1d1-2e0d1fb0eb5mr12800440a91.27.1727721643455;
        Mon, 30 Sep 2024 11:40:43 -0700 (PDT)
Received: from [10.201.20.170] ([71.181.84.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e11908eb91sm3440630a91.44.2024.09.30.11.40.42
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 11:40:43 -0700 (PDT)
Message-ID: <eb52cc47-0e42-4f1a-984d-27d3470da92e@gmail.com>
Date: Mon, 30 Sep 2024 11:40:40 -0700
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: keyrings@vger.kernel.org
From: James Prestwood <prestwoj@gmail.com>
Subject: Reading public key portion of asymmetric keys
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Unless I'm missing something it does not seem possible to read back the 
public key portion of an asymmetric key to userspace once added to the 
kernel. I have a use case where two separate applications need to 
perform crypto operations using the same private/public key pair and for 
added security it would be convenient to add the key (or load from TPM) 
once and pass around a key ID rather than the keys themselves.

One of the things I need is to create and sign a CSR. To create the CSR 
I need the public key contents which can't be obtained from the key ID.

To solve this problem I would propose adding a "read" operation to the 
asymmetric key type, but limiting it to only reading the public key 
portion of the key (if it exists). Alternatively a entirely new 
"read_public" keyctl API could be added as well, but re-using the 
existing read seemed more straight forward. Adding this seems easy 
enough, but I wanted to get an idea if this is something that would be 
accepted upstream or if others had better suggestions.

Thanks,

James


