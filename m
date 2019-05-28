Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5102D0B5
	for <lists+keyrings@lfdr.de>; Tue, 28 May 2019 22:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfE1UwG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 May 2019 16:52:06 -0400
Received: from namei.org ([65.99.196.166]:34918 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbfE1UwG (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 28 May 2019 16:52:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x4SKpvrj005725;
        Tue, 28 May 2019 20:51:57 GMT
Date:   Wed, 29 May 2019 06:51:57 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     David Howells <dhowells@redhat.com>
cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] keys: Add a keyctl to move a key between keyrings
In-Reply-To: <155856412507.10428.15987388402707639951.stgit@warthog.procyon.org.uk>
Message-ID: <alpine.LRH.2.21.1905290646010.31297@namei.org>
References: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk> <155856412507.10428.15987388402707639951.stgit@warthog.procyon.org.uk>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 22 May 2019, David Howells wrote:

> +
> +	if (flags & ~KEYCTL_MOVE_EXCL)
> +		return -EINVAL;
> +
> +	key_ref = lookup_user_key(id, KEY_LOOKUP_CREATE, KEY_NEED_LINK);
> +	if (IS_ERR(key_ref)) {
> +		ret = PTR_ERR(key_ref);
> +		goto error;
> +	}

This could probably be a simple return, as there is no cleanup.

> +
> +	from_ref = lookup_user_key(from_ringid, 0, KEY_NEED_WRITE);
> +	if (IS_ERR(from_ref)) {
> +		ret = PTR_ERR(from_ref);
> +		goto error2;
> +	}
> +
> +	to_ref = lookup_user_key(to_ringid, KEY_LOOKUP_CREATE, KEY_NEED_WRITE);
> +	if (IS_ERR(to_ref)) {
> +		ret = PTR_ERR(to_ref);
> +		goto error3;
> +	}
> +
> +	ret = key_move(key_ref_to_ptr(key_ref), key_ref_to_ptr(from_ref),
> +		       key_ref_to_ptr(to_ref), flags);
> +
> +	key_ref_put(to_ref);
> +error3:
> +	key_ref_put(from_ref);
> +error2:
> +	key_ref_put(key_ref);
> +error:
> +	return ret;
> +}
> +


-- 
James Morris
<jmorris@namei.org>

