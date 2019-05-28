Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A372D08D
	for <lists+keyrings@lfdr.de>; Tue, 28 May 2019 22:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfE1UmA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 May 2019 16:42:00 -0400
Received: from namei.org ([65.99.196.166]:34896 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbfE1UmA (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 28 May 2019 16:42:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x4SKfiYc004893;
        Tue, 28 May 2019 20:41:44 GMT
Date:   Wed, 29 May 2019 06:41:44 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     David Howells <dhowells@redhat.com>
cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] keys: Break bits out of key_unlink()
In-Reply-To: <155856411142.10428.16280282329908085391.stgit@warthog.procyon.org.uk>
Message-ID: <alpine.LRH.2.21.1905290641310.31297@namei.org>
References: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk> <155856411142.10428.16280282329908085391.stgit@warthog.procyon.org.uk>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 22 May 2019, David Howells wrote:

> Break bits out of key_unlink() into helper functions so that they can be
> used in implementing key_move().
> 
> Signed-off-by: David Howells <dhowells@redhat.com>


Reviewed-by: James Morris <jamorris@linux.microsoft.com>


-- 
James Morris
<jmorris@namei.org>

