Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7C61AE269
	for <lists+keyrings@lfdr.de>; Fri, 17 Apr 2020 18:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgDQQoN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 17 Apr 2020 12:44:13 -0400
Received: from mailomta17-sa.btinternet.com ([213.120.69.23]:26005 "EHLO
        sa-prd-fep-046.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725877AbgDQQoN (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 17 Apr 2020 12:44:13 -0400
X-Greylist: delayed 700 seconds by postgrey-1.27 at vger.kernel.org; Fri, 17 Apr 2020 12:44:10 EDT
Received: from sa-prd-rgout-004.btmx-prd.synchronoss.net ([10.2.38.7])
          by sa-prd-fep-049.btinternet.com with ESMTP
          id <20200417163229.QIGD7177.sa-prd-fep-049.btinternet.com@sa-prd-rgout-004.btmx-prd.synchronoss.net>;
          Fri, 17 Apr 2020 17:32:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1587141149; 
        bh=NTjeMUS627Rgv9Q1VbCndKbzdExgZlSrUgziEGI12ac=;
        h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:MIME-Version;
        b=cESUtTFCOaei/2s+BC3dD7LL9sJCUk1C09l4i4tWH5pepNQZQYwYBvDyCfczTxL2N+uT4ubLXnq9g/EanJgk7ayxXtezedUYAYwkKp0hUSI2rriY1prPu0lOnWMgHDw3Zz8wEPktC1CwC26/swoPqqQGIlsF6+WE0+B9uMduu/vaytzqJZQcjynliQo7Zdk7T/cFNOeXuzYVjv8iFaBC0bqEPDrBTBLdbXsOM1L+rp9eFx0RvZH0NddoIpEP1x3u+Nrgl1WnHOS1Als1vxM0HHsJ/N4GaEBjo+4JdG2qCl7NGaF6NVWwXohKJP+bzmU3atfcLp4rX9R2+QVrpfI7fg==
Authentication-Results: btinternet.com;
    auth=pass (PLAIN) smtp.auth=richard_c_haines@btinternet.com
X-Originating-IP: [109.148.52.191]
X-OWM-Source-IP: 109.148.52.191 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduhedrfeejgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddqiedmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomheptfhitghhrghrugcujfgrihhnvghsuceorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddtledrudegkedrhedvrdduledunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpedutdelrddugeekrdehvddrudeluddpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequceuqfffjgepkeeukffvoffkoffgpdhrtghpthhtohepoeguhhhofigvlhhlshesrhgvughhrghtrdgtohhmqedprhgtphhtthhopeeokhgvhihrihhnghhssehvghgvrhdrkhgvrhhnvghlrdhorhhgqedprhgtphhtthhopeeolhhinhhugidqshgvtghurhhithihqdhmohguuhhlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgheqpdhrtghpthhtohepoehprghulhesphgruhhlqdhmohhorhgv
        rdgtohhmqedprhgtphhtthhopeeorhhitghhrghruggptggphhgrihhnvghssehhohhtmhgrihhlrdgtohhmqedprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
Received: from localhost.localdomain (109.148.52.191) by sa-prd-rgout-004.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5E3A27DB0BD8084F; Fri, 17 Apr 2020 17:32:29 +0100
Message-ID: <56808ee47c8b6e184fd013b90072c6fb07ef84f2.camel@btinternet.com>
Subject: Re: Problem with 9ba09998baa9 ("selinux: Implement the watch_key
 security hook") in linux-next
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     Paul Moore <paul@paul-moore.com>,
        David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, selinux@vger.kernel.org,
        linux-security-module@vger.kernel.org
Date:   Fri, 17 Apr 2020 17:32:28 +0100
In-Reply-To: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
References: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 2020-04-17 at 11:48 -0400, Paul Moore wrote:
> I just notice that the "selinux: Implement the watch_key security
> hook" patch made it's way into linux-next via 9ba09998baa9:
> 
>   commit 9ba09998baa995518d94c9a32e6329b28ccb9045
>   Author: David Howells <dhowells@redhat.com>
>   Date:   Tue Jan 14 17:07:13 2020 +0000
> 
>    selinux: Implement the watch_key security hook
> 
>    Implement the watch_key security hook to make sure that a key
> grants the
>    caller View permission in order to set a watch on a key.
> 
>    For the moment, the watch_devices security hook is left
> unimplemented as
>    it's not obvious what the object should be since the queue is
> global and
>    didn't previously exist.
> 
>    Signed-off-by: David Howells <dhowells@redhat.com>
>    Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> 
> I'm reasonably confident that this code hasn't been tested as I
> expect
> it would fail, or at the very least behave in unintended ways.  The
> problem is the selinux_watch_key(...) function, shown below:

I built an selinx-testsuite test for this last year and it worked fine
then. I'll send the test as an RFC patch as its been some time since I
ran it. David also has a test in kernel
samples/watch_queue/watch_test.c

> 
> +static int selinux_watch_key(struct key *key)
> +{
> +       struct key_security_struct *ksec = key->security;
> +       u32 sid = current_sid();
> +
> +       return avc_has_perm(&selinux_state,
> +                           sid, ksec->sid, SECCLASS_KEY,
> KEY_NEED_VIEW, NULL);
> +}
> 
> ... in particular it is the fifth argument to avc_has_perm(),
> "KEY_NEED_VIEW" which is a problem.  KEY_NEED_VIEW is not a SELinux

True, however by magic the KEY_NEED_* perms match with the bits defined
in classmap.h. I did some work on this during the 'keys' saga, see
various emails in list like [1]

[1] 
https://lore.kernel.org/selinux/20200220181031.156674-2-richard_c_haines@btinternet.com/

> permission and would likely result in odd behavior when passed to
> avc_has_perm().  Given that the keyring permission to SELinux object
> class permission is variable depending on the key_perms policy
> capability, it probably makes the most sense to pull the permission
> mapping in selinux_key_permission() out into a separate function,
> e.g.
> key_perm_to_av(...) (see the other XXX_to_av() functions in
> security/selinux/hooks.c), and then use this newly created mapping
> function in both selinux_key_permission() and
> selinux_watch_key().  Or
> you could just duplicate the KEY_NEED_VIEW mapping code in both
> functions, but I would advise against that.
> 

