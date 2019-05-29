Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 152792E7A5
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2019 23:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfE2VtS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 17:49:18 -0400
Received: from namei.org ([65.99.196.166]:35242 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfE2VtS (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 29 May 2019 17:49:18 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x4TLn9MV006417;
        Wed, 29 May 2019 21:49:09 GMT
Date:   Thu, 30 May 2019 07:49:09 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     Eric Biggers <ebiggers@kernel.org>
cc:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Subject: Re: [PATCH RESEND] KEYS: remove CONFIG_KEYS_COMPAT
In-Reply-To: <20190529210209.120390-1-ebiggers@kernel.org>
Message-ID: <alpine.LRH.2.21.1905300748560.5445@namei.org>
References: <20190529210209.120390-1-ebiggers@kernel.org>
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
> KEYS_COMPAT now always takes the value of COMPAT && KEYS.  But the
> security/keys/ directory is only compiled if KEYS is enabled, so in
> practice KEYS_COMPAT is the same as COMPAT.  Therefore, remove the
> unnecessary KEYS_COMPAT and just use COMPAT directly.
> 
> (Also remove an outdated comment from compat.c.)
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>


Reviewed-by: James Morris <jamorris@linux.microsoft.com>


-- 
James Morris
<jmorris@namei.org>

