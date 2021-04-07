Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B76C35740D
	for <lists+keyrings@lfdr.de>; Wed,  7 Apr 2021 20:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355154AbhDGSQF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 7 Apr 2021 14:16:05 -0400
Received: from alln-iport-4.cisco.com ([173.37.142.91]:52518 "EHLO
        alln-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355150AbhDGSQC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 7 Apr 2021 14:16:02 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Apr 2021 14:15:59 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1733; q=dns/txt; s=iport;
  t=1617819353; x=1619028953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I2B/l0BZ2IBFeo5zroet5ZcFM1Gn2lU1WCWA/j5KrhY=;
  b=L7lDePtrCbrc55qKP48XShSLI718ubRQryHhsPe89QIJ35/2dHNTkYIN
   34bCel9YaJwYlZAOfSMlK6UWAen5nB/S8T3uGtoZmJQLUarkEWXTQimz/
   15O4VNvvuNB2/HCo0Vs2+NSYWF0sPQbPczkunBzk+jeXYFDSdOJx+F/K+
   I=;
X-IPAS-Result: =?us-ascii?q?A0AHAABF9G1gmIgNJK1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFAgUEBAQEBAQELAYMhVgE5MQIBkzmCWgOQDYxYCwEBA?=
 =?us-ascii?q?Q0BASwIBAEBhFACgXcCJTcGDgIDAQEBAwIDAQEBAQEFAQEBAgEGBBQBAQEBA?=
 =?us-ascii?q?QEBAWiFUA2GRQECAzo/EAsSBi48DQ4GE4JxAYMHD6w4dYE0gQGDPwGEZoE+B?=
 =?us-ascii?q?iKBFwGNSgInHIFJQoQ1PoF9ghyDdYIrBIJABQGBDwshBUp7OyEFlBCKW5sVg?=
 =?us-ascii?q?RSDFYEmiD2TCjIQgz2hJJcliVqSUTWEOQIEBgUCFoFqIoFbMxoIGxWCcAEBM?=
 =?us-ascii?q?xI9GQ6OOIhrhWUhAzEBAQEIKwIGCgEBAwmKTIJFAQE?=
IronPort-HdrOrdr: A9a23:qnFkZKhYGydZwDdpyOQwM/DDCnBQXmcji2hD6mlwRA09T+Wzna
 mV88gz/xnylToXRTUMmcqYPrOBXHPb8vdOkOwsFJ2lWxTrv3btEZF64eLZsl/dMgD36+I178
 1dWodkDtmYNzVHpOb8pDK1CtMxhOSAmZrY4dv261dIYUVUZ7p77wF/YzzrcXFeYAVdH5I2GN
 69y6N8xgaIQngcYsSlCnRtZYGqzOHjr57obQULABQq8mC17Q+A0qLwEBSTw34lPQ9n/LFKyw
 T4uj28wLm/uPemzRKZ8Gnf4/1t6b3c4+oGItCQgc4ILTipsCKUXcBKXr2Puy1dmpDJ1GoX
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,203,1613433600"; 
   d="scan'208";a="666219298"
Received: from alln-core-3.cisco.com ([173.36.13.136])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 07 Apr 2021 18:08:41 +0000
Received: from zorba ([10.24.2.1])
        by alln-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 137I8dI2017172
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 7 Apr 2021 18:08:40 GMT
Date:   Wed, 7 Apr 2021 11:08:39 -0700
From:   Daniel Walker <danielwa@cisco.com>
To:     Mimi Zohar <zohar@linux.ibm.com>
Cc:     Mehmet Kayaalp <mkayaalp@linux.vnet.ibm.com>,
        Nayna Jain <nayna@linux.ibm.com>,
        George Wilson <gcwilson@us.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: cert update procedure with insert-sys-cert
Message-ID: <20210407180839.GB3981976@zorba>
References: <20210407162534.GA3981976@zorba>
 <ef2f5a5ac6396a0c29a5680cff0388b0c42a0400.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef2f5a5ac6396a0c29a5680cff0388b0c42a0400.camel@linux.ibm.com>
X-Outbound-SMTP-Client: 10.24.2.1, [10.24.2.1]
X-Outbound-Node: alln-core-3.cisco.com
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Apr 07, 2021 at 12:51:13PM -0400, Mimi Zohar wrote:
> [Cc'ing Nayna Jain, George Wilson]
> 
> Hi Daniel,
> 
> On Wed, 2021-04-07 at 09:32 -0700, Daniel Walker wrote:
> > Hi,
> > 
> > I was wondering about the practical use of this insert-sys-cert. How is the compressed
> > kernel re-made ? You submitted this change,
> > 
> > https://patchwork.kernel.org/project/linux-security-module/patch/20180502230811.2751-4-mkayaalp@linux.vnet.ibm.com/
> > 
> > for re-assemble a bzImage for x86. Is it the case that the bzImage can not be
> > re-assembled by using the make system ?
> > 
> > Cisco is similar to IBM in that we internally distribute a binary SDK with a
> > kernel. The actual build tree is only saved in a partial form.
> > 
> > We currently use the above commit to insert a certificate for x86, however, I've
> > found that other architecture are more complex than x86. For example , powerpc
> > images maybe not have ELF headers.
> > 
> > I'm wondering what values does the insert-sys-cert have without the bzImage
> > commit ? Am I using it wrong, and there's a way to use the make system to
> > reassemble ?
> 
> On powerpc, the kernel image is signed with an appended signature,
> using the same format as kernel modules.  scripts/sign-file.c can be
> used to append the kernel image signature.  Verifying the kernel image
> is limited on powerpc to kexec_file_load syscall.
> 
> The CONFIG_IMA_ARCH_POLICY loads architecture specific rules.  With
> secure boot enabled on powerpc, it loads a policy requiring the kernel
> image to be signed.

There is no way to insert new certificates with the insert-sys-cert tool ? Or
maybe I'm not understanding your comments.

Daniel
