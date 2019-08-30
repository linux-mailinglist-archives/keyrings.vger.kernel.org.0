Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43881A303D
	for <lists+keyrings@lfdr.de>; Fri, 30 Aug 2019 08:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbfH3GsQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+keyrings@lfdr.de>); Fri, 30 Aug 2019 02:48:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52878 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbfH3GsP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 30 Aug 2019 02:48:15 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7U6ke6S037112
        for <keyrings@vger.kernel.org>; Fri, 30 Aug 2019 02:48:14 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2upwe0tt6q-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Fri, 30 Aug 2019 02:48:14 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <keyrings@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Fri, 30 Aug 2019 07:48:12 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 30 Aug 2019 07:48:09 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7U6m81s33554608
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Aug 2019 06:48:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D071F52057;
        Fri, 30 Aug 2019 06:48:08 +0000 (GMT)
Received: from [9.199.196.167] (unknown [9.199.196.167])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 193B55204F;
        Fri, 30 Aug 2019 06:48:07 +0000 (GMT)
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Oops (request_key_auth_describe) while running cve-2016-7042 from LTP
Date:   Fri, 30 Aug 2019 12:18:07 +0530
Cc:     linuxppc-dev@ozlabs.org, keyrings@vger.kernel.org,
        dhowells@redhat.com
To:     linux-kernel@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19083006-4275-0000-0000-0000035EFBB9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19083006-4276-0000-0000-0000387134E7
Message-Id: <85B7196E-D717-4F19-A7E8-82A18287A3DE@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-30_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908300071
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

While running LTP tests (specifically cve-2016-7042) against 5.3-rc6
(commit 4a64489cf8) on a POWER9 LPAR, following problem is seen

[ 3373.814425] FS-Cache: Netfs 'nfs' registered for caching
[ 7695.250230] Clock: inserting leap second 23:59:60 UTC
[ 8074.351033] BUG: Kernel NULL pointer dereference at 0x00000038
[ 8074.351046] Faulting instruction address: 0xc0000000004ddf30
[ 8074.351052] Oops: Kernel access of bad area, sig: 11 [#1]
[ 8074.351056] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[ 8074.351067] Dumping ftrace buffer:
[ 8074.351081]    (ftrace buffer empty)
[ 8074.351085] Modules linked in: nfsv3 nfs_acl nfs lockd grace fscache sctp tun brd vfat fat fuse xfs overlay loop iscsi_target_mod target_core_mod macsec tcp_diag udp_diag inet_diag unix_diag af_packet_diag netlink_diag binfmt_misc bridge stp llc ip6t_rpfilter ipt_REJECT nf_reject_ipv4 ip6t_REJECT nf_reject_ipv6 xt_conntrack ip_set nfnetlink ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle iptable_raw ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter sunrpc uio_pdrv_genirq pseries_rng sg uio ip_tables ext4 mbcache jbd2 sr_mod cdrom sd_mod ibmvscsi ibmveth scsi_transport_srp dm_mirror dm_region_hash dm_log dm_mod [last unloaded: dummy_del_mod]
[ 8074.351153] CPU: 10 PID: 8314 Comm: cve-2016-7042 Tainted: G           O      5.3.0-rc6-autotest #1
[ 8074.351158] NIP:  c0000000004ddf30 LR: c0000000004ddef4 CTR: c0000000004ddea0
[ 8074.351164] REGS: c0000000e74fb800 TRAP: 0300   Tainted: G           O       (5.3.0-rc6-autotest)
[ 8074.351170] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 88002482  XER: 00000000
[ 8074.351177] CFAR: c00000000000dfc4 DAR: 0000000000000038 DSISR: 40000000 IRQMASK: 0 
[ 8074.351177] GPR00: c0000000004ddef4 c0000000e74fba90 c0000000013cc200 c0000008b0d7039b 
[ 8074.351177] GPR04: c0000008b0dabe3e 0000000000000007 00090a0200000904 c0000008b0d80000 
[ 8074.351177] GPR08: 00000000000003a2 0000000000000001 000000000000039b c000000000d03ac0 
[ 8074.351177] GPR12: c0000000004ddea0 c00000001ec5dc00 0000000000000000 0000000000000000 
[ 8074.351177] GPR16: 0000000000000000 0000000000000002 000000001b010000 0000000000000000 
[ 8074.351177] GPR20: 000000003bc24df7 c0000000e74fbc28 0000000000000049 0000000000000052 
[ 8074.351177] GPR24: 000000000000002d c0000000ffe30780 c0000008a991d800 000000000000002d 
[ 8074.351177] GPR28: 0000000000000069 0000000000000000 c0000000ffe30780 c0000008a991d800 
[ 8074.351224] NIP [c0000000004ddf30] request_key_auth_describe+0x90/0xd0
[ 8074.351230] LR [c0000000004ddef4] request_key_auth_describe+0x54/0xd0
[ 8074.351233] Call Trace:
[ 8074.351237] [c0000000e74fba90] [c0000000004ddef4] request_key_auth_describe+0x54/0xd0 (unreliable)
[ 8074.351244] [c0000000e74fbb10] [c0000000004df718] proc_keys_show+0x308/0x4c0
[ 8074.351250] [c0000000e74fbcc0] [c000000000404950] seq_read+0x3d0/0x540
[ 8074.351255] [c0000000e74fbd40] [c0000000004865e0] proc_reg_read+0x90/0x110
[ 8074.351261] [c0000000e74fbd70] [c0000000003c901c] __vfs_read+0x3c/0x70
[ 8074.351267] [c0000000e74fbd90] [c0000000003c9104] vfs_read+0xb4/0x1b0
[ 8074.351272] [c0000000e74fbdd0] [c0000000003c95ec] ksys_read+0x7c/0x130
[ 8074.351277] [c0000000e74fbe20] [c00000000000b388] system_call+0x5c/0x70
[ 8074.351281] Instruction dump:
[ 8074.351285] 2b890001 419e002c 38210080 e8010010 eba1ffe8 ebc1fff0 ebe1fff8 7c0803a6 
[ 8074.351292] 4e800020 60000000 60000000 60420000 <e8bd003a> e8dd0030 3c82ff93 7fc3f378 
[ 8074.351301] ---[ end trace d3304a3a5a0a0ca1 ]—

These CVE tests from LTP were recently added to the automated regression test bucket that
I run against upstream. I can’t tell if this is a regression or a new problem.

Thanks
-Sachin
