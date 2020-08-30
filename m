Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559AB256EDC
	for <lists+keyrings@lfdr.de>; Sun, 30 Aug 2020 17:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgH3PBV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 30 Aug 2020 11:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgH3PBU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 30 Aug 2020 11:01:20 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EAEC061573;
        Sun, 30 Aug 2020 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=oCHVt42okohO0gylQNQyVW0C6OzwnP8SCmOEeTDqT64=; b=jR6mRCmVYr8gGatQ+zdEvZl9rh
        9xYIOVNIVBW+1W1Ej2rOACKMnKijQfCTVesTlC8gnvnX0bfBE4Ed3to8Ys5g1pXrSzLPUMjrXN867
        McbupSCJymUCyAzXTXg6NeTZ+no06tfnTPou9u3fUVTOtylqWnSOKDWaV58fbRN8N7oB6UktciJI1
        5kcCUnrWedZ8SK/GEOEYTrstC/mfk8qwLf3aazvlPKozcniHSmzZN5Mo8D/Hw6yJJ9LHzVWrb5cnN
        Lp1supJIteoshFPENdZJ2+hIwktQJRQ/D0fg+s1aBs71yOysRw9mdl5koV21FCUGLrzLPwTJE+LkK
        07PxRPfQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCOpV-0004JZ-09; Sun, 30 Aug 2020 15:01:13 +0000
Subject: Re: [RESEND PATCH] KEYS: asymmetric: Fix kerneldoc
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200819175212.20583-1-krzk@kernel.org>
 <20200830145655.GA31461@kozik-lap>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <46f2119d-d94c-517f-46cf-10ec27c820f3@infradead.org>
Date:   Sun, 30 Aug 2020 08:01:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200830145655.GA31461@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 8/30/20 7:56 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 19, 2020 at 07:52:12PM +0200, Krzysztof Kozlowski wrote:
>> Fix W=1 compile warnings (invalid kerneldoc):
>>
>>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid1' not described in 'asymmetric_key_id_same'
>>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Function parameter or member 'kid2' not described in 'asymmetric_key_id_same'
>>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_1' description in 'asymmetric_key_id_same'
>>     crypto/asymmetric_keys/asymmetric_type.c:160: warning: Excess function parameter 'kid_2' description in 'asymmetric_key_id_same'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>  crypto/asymmetric_keys/asymmetric_type.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> Hi David, Herbert,
> 
> Any comments here?
> 
> Best regards,
> Krzysztof

LGTM.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
