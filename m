Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C71D2D0C9
	for <lists+keyrings@lfdr.de>; Tue, 28 May 2019 23:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727710AbfE1VCC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 May 2019 17:02:02 -0400
Received: from namei.org ([65.99.196.166]:34926 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbfE1VCC (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 28 May 2019 17:02:02 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x4SL1l6H006382;
        Tue, 28 May 2019 21:01:47 GMT
Date:   Wed, 29 May 2019 07:01:47 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     David Howells <dhowells@redhat.com>
cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] keys: Grant Link permission to possessers of
 request_key auth keys
In-Reply-To: <155856413201.10428.13385006340817641517.stgit@warthog.procyon.org.uk>
Message-ID: <alpine.LRH.2.21.1905290701390.31297@namei.org>
References: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk> <155856413201.10428.13385006340817641517.stgit@warthog.procyon.org.uk>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 22 May 2019, David Howells wrote:

> Grant Link permission to the possessers of request_key authentication keys,
> thereby allowing a daemon that is servicing upcalls to arrange things such
> that only the necessary auth key is passed to the actual service program
> and not all the daemon's pending auth keys.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>


Reviewed-by: James Morris <jamorris@linux.microsoft.com>


-- 
James Morris
<jmorris@namei.org>

