Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3686D1508B7
	for <lists+keyrings@lfdr.de>; Mon,  3 Feb 2020 15:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728453AbgBCOrO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 3 Feb 2020 09:47:14 -0500
Received: from UPDC19PA20.eemsg.mail.mil ([214.24.27.195]:51812 "EHLO
        UPDC19PA20.eemsg.mail.mil" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgBCOrO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 3 Feb 2020 09:47:14 -0500
X-EEMSG-check-017: 53459500|UPDC19PA20_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.70,398,1574121600"; 
   d="scan'208";a="53459500"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
  by UPDC19PA20.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256; 03 Feb 2020 14:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
  s=tycho.nsa.gov; t=1580741230; x=1612277230;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=mlEgYiLR0e/YYeOFSi5nlbhUn9UqushYCgbvRZwH7KY=;
  b=bA6VFNYOd0pBQWAI9oAY4UjGAS6hiehmqQhP0bt1DtsRyrarnZudKTUx
   LfmOPke4nnS/7UdGcebHX9zkttq3J+JrkL4cbuuf1l4t72Vrwg9ZyQ+nc
   fo1359JXTWa+3GS9bkNCgc2aygFgScGj/IecCAIeHJcf08+8f9LtE0NN8
   HWn8GJbHokxYZDiFj3d+f9ZNhjemrxqFtTQ+0LMrEQ/YbdgGw/S1aLK5w
   gYi7X486bwA8gmBVdB6sAHagTZRWEmVTsAPS0U/yMAyrrFnX2XsOEd3UZ
   tA/mwxt0yq3DRaRZTtr8H9r6eVmYRirVDe+qp041Pt33GOhstOGwCahUQ
   Q==;
X-IronPort-AV: E=Sophos;i="5.70,398,1574121600"; 
   d="scan'208";a="32606774"
IronPort-PHdr: =?us-ascii?q?9a23=3A+2fUxh27oA84abtVsmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZsesVLfTxwZ3uMQTl6Ol3ixeRBMOHsq4C17Wd7f6oGTRZp8rY6zZaKN0Efi?=
 =?us-ascii?q?RGoP1epxYnDs+BBB+zB9/RRAt+Iv5/UkR49WqwK0lfFZW2TVTTpnqv8WxaQU?=
 =?us-ascii?q?2nZkJ6KevvB4Hdkdm82fys9J3PeQVIgye2ba9vIBmsogjdq8YbjZFtJ6szxR?=
 =?us-ascii?q?fEo3pFcPlSyW90OF6fhRnx6tq+8ZJ57yhcp/ct/NNcXKvneKg1UaZWByk8PW?=
 =?us-ascii?q?Av483ruxjDTQ+R6XYZT24bjBlGDRXb4R/jRpv+vTf0ueR72CmBIM35Vqs0Vi?=
 =?us-ascii?q?i476dqUxDnliEKPCMk/W7Ni8xwiKVboA+9pxF63oXZbp2ZOOZ4c6jAZt4RW3?=
 =?us-ascii?q?ZPUdhNWCxAGoO8bpUAD+wdPeZDsoLxo0ICoQaiCQWwAe/izDFHhmXy3aYnze?=
 =?us-ascii?q?ovFw/I1xEkE94XvnnZqND5OaEPWu630abI1y3OYe5I1zfz6IbGcR4vrv+DUr?=
 =?us-ascii?q?1ybcXfxlIiFx/Hg1iKtYDpIz2Y2+YLvmOG7+RgT+Wvi2s/pg9svjig2N8sio?=
 =?us-ascii?q?nXiYIT11vK6CB5z5wxJd28VkF6YcOvHZxLty6HLIt7Wd8iQmF0tyY6zb0Ko5?=
 =?us-ascii?q?i7fDMQx5g9yB7fbOKHfpGO7xn+WuiRJjJ4i2hkeLK5nxuy8lavyvf6Vsaq1F?=
 =?us-ascii?q?ZGtC1FksPDtn0Lyhfd6dCHR+Ng8kqu1juDzQDe5vxeLUwqmqfXNYQtzqM2m5?=
 =?us-ascii?q?EOq0rMBDX2l1/zjKKOc0Uk/fWn5Pr/b7X9o5+cK5d0igbjMqQygsC/Afo3Mg?=
 =?us-ascii?q?wJX2WD5eSzzqfj/UzkQLVRlPE2k6/ZsJ7dJcQAuKG2HxVZ0poj6hmjDzem18?=
 =?us-ascii?q?4UnX8bI1JeZB2LlY3pO1DKIPzgDPe/hUqjkCtzyvzbMbDsDY/BI3jenLv7Y7?=
 =?us-ascii?q?pw5FBQxBAuwdxH4pJbELABIPb9Wk/rs9zYCwc0MxepzOb8E9h9yoMfVn6PAq?=
 =?us-ascii?q?+eKq/St0SI6fg1L+mDY48Vpi7xK+I56P72kX85hVgdcLGz3ZsWdH+4Hu5pI1?=
 =?us-ascii?q?+EbnX0ntgOCWcKsRA/TOzsllKCSiVeaG2uX6I94DE7FJypDZ3FRo+znLyNxj?=
 =?us-ascii?q?u0HppTZmpeEFCDDW/od5mYW/cLcC+dP89hkjsKVLe/T48h0QquuRTgy7V5M+?=
 =?us-ascii?q?XU+jcXtY752Ndp4O3TkAk49SZoAMSFz2GNU2Z0k3sQRzAswaB/pVdwyk+Z3q?=
 =?us-ascii?q?hlh/xUDNlT5/ROUgcgK5HQ1fB1C9f3WgjZZNeGVE6mQsm6ATE2Vt8xwMEBYk?=
 =?us-ascii?q?ZnG9WjiBDD0DGqDqQLl7yEGpM06LjQ33vvKMZnzXbJyq0hg0MhQstVOm2snr?=
 =?us-ascii?q?R/+BTLB47Vj0WZkL6ndb8C0y7J9WeDy3eOvU5DXQ5uXqXKQ2ofalHVrdvn/E?=
 =?us-ascii?q?PCSaGhCbA9PgtG086CJbNAasf1glVeWPfjJNPebnq1m2exAxaI27yNYJPxe2?=
 =?us-ascii?q?oDwCrdFVIEkwEP/XeGLAQ+AyChrH/DDDxqC13ieF3s8eZgp3OhVEM0zB+Fb1?=
 =?us-ascii?q?dn17Wr/h4Zn/ucS+kc3rgcoicuty10HEqh39LRE9eAowthfKNBYdIy+VtH1n?=
 =?us-ascii?q?zWtxZ7PpO+K6BvnUAecwtpsEP0zRl3CZtPkdIsrHw0yAp+M6WY0ElOd2DQ4Z?=
 =?us-ascii?q?elALzcKmDo8FiPYq/Q10qWhMyX8acG8vgPoGLjtQCvG1EK+Wlm1cVYyX2R+t?=
 =?us-ascii?q?PBCw9EFdrdW1g2+1BaoK7XZi0mr9fY1XpzPK2wqRfY1t4pDfdjwRGlKZMXKK?=
 =?us-ascii?q?qZECfqGtAeQs2pL/Yn3VOua0EqJudXoZUoMtumev3O46uiOOJtjXrylmhcyJ?=
 =?us-ascii?q?xs2UKLsSxnQ6jH2IhTkKLQ5ReOSzqp1ATpicvwg40RIGhJT2c=3D?=
X-IPAS-Result: =?us-ascii?q?A2D8AACpMThe/wHyM5BlGwEBAQEBAQEFAQEBEQEBAwMBA?=
 =?us-ascii?q?QGBe4F9gRhVIBIqhBSJA4ZdAQEGgTeJb5FJCQEBAQEBAQEBAS0KAQGEQAKCW?=
 =?us-ascii?q?DgTAhABAQEEAQEBAQEFAwEBbIU3DII7KQGDAQEBAQECASMVQQULCxgCAiYCA?=
 =?us-ascii?q?lcGAQwGAgEBgmM/AYJKAwkFIA+qdXWBMoQ1AYEUgz6BOAaBDiqMOnmBB4E4D?=
 =?us-ascii?q?4IvLj6CG4VAgl4ElzhGiC6PNoJFgk6EeI50BhuCSIgOkDKOYYhnlEQigVgrC?=
 =?us-ascii?q?AIYCCEPO4JtTxgNjikXiGSFXSMDMgGPBgEB?=
Received: from tarius.tycho.ncsc.mil (HELO tarius.infosec.tycho.ncsc.mil) ([144.51.242.1])
  by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 03 Feb 2020 14:47:08 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
        by tarius.infosec.tycho.ncsc.mil (8.14.7/8.14.4) with ESMTP id 013Ek9Bd195640;
        Mon, 3 Feb 2020 09:46:09 -0500
Subject: Re: SELinux: How to split permissions for keys?
To:     Richard Haines <richard_c_haines@btinternet.com>,
        David Howells <dhowells@redhat.com>, paul@paul-moore.com
Cc:     keyrings@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8ee40192da117d9cdf4eab1e63ab5f77b359801c.camel@btinternet.com>
 <4057700.1579792320@warthog.procyon.org.uk>
 <de2c5cda-567b-d310-42f7-46a2c20969c4@tycho.nsa.gov>
 <50f98f04-d00e-ae54-9a90-d0ff10be515a@tycho.nsa.gov>
 <459818a9ad1c808298bf3d7c9bcb130323d30e97.camel@btinternet.com>
 <3d1923ec-f02b-6be7-b0c0-d3d6f539b034@tycho.nsa.gov>
 <de8d82ba7db7abdf2a72d88c8cbc590e289f5f6f.camel@btinternet.com>
From:   Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <bd03ab75-7df5-7de8-4d31-9f3e02bcb10e@tycho.nsa.gov>
Date:   Mon, 3 Feb 2020 09:48:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <de8d82ba7db7abdf2a72d88c8cbc590e289f5f6f.camel@btinternet.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2/3/20 9:03 AM, Richard Haines wrote:
> On Mon, 2020-02-03 at 08:13 -0500, Stephen Smalley wrote:
>> Was that kernel patch ever posted to selinux list and/or the selinux
>> kernel maintainers?  I don't recall seeing it.  If not, please send
>> it
>> to the selinux list for review; at least one selinux maintainer
>> should
>> ack it before it gets accepted into any other tree.
>>
>>
> 
> Not formally. I did post it in a discussion about keys in [2]. Since
> then it's been modified to support the split permissions.

Yes, that doesn't count since a) it wasn't the final version of the 
patch which changed significantly afterward and b) even it had been the 
final version, there was no acked-by or reviewed-by from a selinux 
maintainer, just some suggestions.  A non-trivial patch that modifies 
security/selinux needs to be at least acked by a selinux maintainer and 
often should go through the upstream selinux maintainer (Paul).

> I've extracted the patch from [1] and will post that to list for
> comments.

Thanks.

> [2]
> https://lore.kernel.org/selinux/35455b30b5185780628e92c98ec8191c70f39bde.camel@btinternet.com/



