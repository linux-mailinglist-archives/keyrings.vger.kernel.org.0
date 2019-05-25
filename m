Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 668C12A2AA
	for <lists+keyrings@lfdr.de>; Sat, 25 May 2019 05:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfEYD52 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 24 May 2019 23:57:28 -0400
Received: from namei.org ([65.99.196.166]:34408 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbfEYD52 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 24 May 2019 23:57:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x4P3vQw8032424;
        Sat, 25 May 2019 03:57:26 GMT
Date:   Sat, 25 May 2019 13:57:26 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     David Howells <dhowells@redhat.com>
cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] keys: sparse: Fix kdoc mismatches
In-Reply-To: <155856410370.10428.4854212353631906601.stgit@warthog.procyon.org.uk>
Message-ID: <alpine.LRH.2.21.1905251357160.32154@namei.org>
References: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk> <155856410370.10428.4854212353631906601.stgit@warthog.procyon.org.uk>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 22 May 2019, David Howells wrote:

> Fix some kdoc argument description mismatches reported by sparse and give
> keyring_restrict() a description.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Mat Martineau <mathew.j.martineau@linux.intel.com>


Reviewed-by: James Morris <jamorris@linux.microsoft.com>


-- 
James Morris
<jmorris@namei.org>

