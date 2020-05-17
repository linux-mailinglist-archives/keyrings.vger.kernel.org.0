Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5261D64E4
	for <lists+keyrings@lfdr.de>; Sun, 17 May 2020 02:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgEQA1t (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 16 May 2020 20:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgEQA1t (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 16 May 2020 20:27:49 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36BC8C061A0C;
        Sat, 16 May 2020 17:27:49 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so2972542pfx.7;
        Sat, 16 May 2020 17:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NIIv/XyY0O9Xz6PLyvj9mxt+StwQRUOgmE4anFhaN7Q=;
        b=eZM12Y5QF2vu3U/oPfGiRQrKgdsqdS6VH89cAt7GiBSFWhvvqQbtcN4RTBqGeB13j8
         0soEliS0TIb3kqeo5cds5xiKNiO0YlkZttGPKlLMPWAiXyWKW9cY0Ez3X8ebqic1HMaS
         xAgoMZHyPlAn6uKNRYQDa83wX5OTS/h6WB273VFiCF8i14GyJLrCzVo0HIgu6er/wlSd
         yocH0myVYzg92DmtrjX+JSkHxpbR2ItDTt+gpDnB/LiPKDMNFOrwFk9LHeepTu1JUYJb
         pXW/JS6j08YhggraE/twY3wWWytRuG7AIkuG6X9IcUluanKwXJH7xygez+Xt8o/t8OIJ
         ACVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NIIv/XyY0O9Xz6PLyvj9mxt+StwQRUOgmE4anFhaN7Q=;
        b=JKASqW1SjSu6vn45wsnMIURfulotG0h/nDTDHcyn9AygRIutjHXFY3As3a8sJRsd69
         +1iAWNH5iJqGln+W0TU3TZLiIW+YjQy7oO3zxR3B1ETO4E0ZRtQTabHkJFXD65fuv9op
         jSU959NySOIDZqjDrsCxNXiLYDwB+mQyM7DwRna8LpSrd3AZeyPaJzXPyVR5hIGoN++E
         JgpXwYW/TNWjX3wgIPXsqlIk7l4fdpfo/Gt7LvaCBtdlIcjzhjHF0JVferQQL8JwqVZj
         tTZp1bp7t6p2SBGaBilLZYY75NaXrf6H9JMUAl2lg4HvYYYgwjBHdEn5mOsdMKYJpC3P
         Gmuw==
X-Gm-Message-State: AOAM531wEx3M/M0wTkRsjZ/JEjvi5ZJ8gM8G6vqONV6f2H/Cg6GSJ5rq
        zf6ChwmWzQM/iTmeYLnkl6E=
X-Google-Smtp-Source: ABdhPJwsa9AocdDlyKPIRck6y0pp4qnnz6xKVHUzR46H8TOxyF/1wqQjkq0i5/K2t5AS2fIaleSBcg==
X-Received: by 2002:a62:3c5:: with SMTP id 188mr10053202pfd.41.1589675267856;
        Sat, 16 May 2020 17:27:47 -0700 (PDT)
Received: from [192.168.68.125] ([210.185.116.244])
        by smtp.gmail.com with ESMTPSA id p24sm5080988pff.92.2020.05.16.17.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2020 17:27:46 -0700 (PDT)
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-mm@kvack.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        David Rientjes <rientjes@google.com>
References: <20200407200318.11711-1-longman@redhat.com>
 <1158ff38-c65d-379f-8ae7-6f507d9fc8dd@gmail.com>
 <20200514120018.GA16070@bombadil.infradead.org>
From:   Balbir Singh <bsingharora@gmail.com>
Message-ID: <f779dea1-3b50-e354-3914-7394b4473f5b@gmail.com>
Date:   Sun, 17 May 2020 10:27:39 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200514120018.GA16070@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org



On 14/5/20 10:00 pm, Matthew Wilcox wrote:
> On Thu, May 14, 2020 at 09:00:40PM +1000, Balbir Singh wrote:
>> I wonder if the right thing to do is also to disable pre-emption, just so that the thread does not linger on with sensitive data.
>>
>> void kvfree_sensitive(const void *addr, size_t len)
>> {
>> 	preempt_disable();
>> 	if (likely(!ZERO_OR_NULL_PTR(addr))) {
>> 		memzero_explicit((void *)addr, len);
>> 		kvfree(addr);
>> 	}
>> 	preempt_enable();
>> }
>> EXPORT_SYMBOL(kvfree_sensitive);
> 
> If it's _that_ sensitive then the caller should have disabled preemption.
> Because preemption could otherwise have occurred immediately before
> kvfree_sensitive() was called.
> 

May be, but the callers of the API have to be explictly aware of the contract.
I don't disagree with you on what you've said, but I was referring to the
intent of freeing sensitive data vs the turn around time for doing so.

Balbir Singh.
