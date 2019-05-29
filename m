Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7547E2E7A4
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2019 23:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfE2VtH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 17:49:07 -0400
Received: from namei.org ([65.99.196.166]:35234 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfE2VtG (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 29 May 2019 17:49:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x4TLmhFa006401;
        Wed, 29 May 2019 21:48:43 GMT
Date:   Thu, 30 May 2019 07:48:43 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     Eric Biggers <ebiggers@kernel.org>
cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH RESEND] KEYS: reuse keyring_index_key::desc_len in
 lookup_user_key()
In-Reply-To: <20190529210152.120249-1-ebiggers@kernel.org>
Message-ID: <alpine.LRH.2.21.1905300748350.5445@namei.org>
References: <20190529210152.120249-1-ebiggers@kernel.org>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 29 May 2019, Eric Biggers wrote:

> From: Eric Biggers <ebiggers@google.com>
> 
> When lookup_user_key() checks whether the key is possessed, it should
> use the key's existing index_key including the 'desc_len' field, rather
> than recomputing the 'desc_len'.  This doesn't change the behavior; this
> way is just simpler and faster.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>


Reviewed-by: James Morris <jamorris@linux.microsoft.com>

-- 
James Morris
<jmorris@namei.org>

