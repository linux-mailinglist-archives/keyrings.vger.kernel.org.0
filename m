Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C72AC2D096
	for <lists+keyrings@lfdr.de>; Tue, 28 May 2019 22:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfE1Umg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 May 2019 16:42:36 -0400
Received: from namei.org ([65.99.196.166]:34906 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbfE1Umg (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 28 May 2019 16:42:36 -0400
Received: from localhost (localhost [127.0.0.1])
        by namei.org (8.14.4/8.14.4) with ESMTP id x4SKgU6B004966;
        Tue, 28 May 2019 20:42:30 GMT
Date:   Wed, 29 May 2019 06:42:30 +1000 (AEST)
From:   James Morris <jmorris@namei.org>
To:     David Howells <dhowells@redhat.com>
cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] keys: Make __key_link_begin() handle lockdep
 nesting
In-Reply-To: <155856411812.10428.4394700002321005951.stgit@warthog.procyon.org.uk>
Message-ID: <alpine.LRH.2.21.1905290642180.31297@namei.org>
References: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk> <155856411812.10428.4394700002321005951.stgit@warthog.procyon.org.uk>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 22 May 2019, David Howells wrote:

> Make __key_link_begin() handle lockdep nesting for the implementation of
> key_move() where we have to lock two keyrings.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>


Reviewed-by: James Morris <jamorris@linux.microsoft.com>

-- 
James Morris
<jmorris@namei.org>

