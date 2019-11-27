Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F66610B622
	for <lists+keyrings@lfdr.de>; Wed, 27 Nov 2019 19:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfK0Swb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Nov 2019 13:52:31 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1262 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727124AbfK0Swb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Nov 2019 13:52:31 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xARIoSlK001831
        for <keyrings@vger.kernel.org>; Wed, 27 Nov 2019 13:52:30 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whhgcv330-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Wed, 27 Nov 2019 13:52:29 -0500
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <keyrings@vger.kernel.org> from <zohar@linux.ibm.com>;
        Wed, 27 Nov 2019 18:52:27 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 27 Nov 2019 18:52:23 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xARIqNot58327128
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Nov 2019 18:52:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0216042049;
        Wed, 27 Nov 2019 18:52:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EDA904203F;
        Wed, 27 Nov 2019 18:52:21 +0000 (GMT)
Received: from dhcp-9-31-103-87.watson.ibm.com (unknown [9.31.103.87])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 27 Nov 2019 18:52:21 +0000 (GMT)
Subject: Re: [PATCH v9 5/6] IMA: Add support to limit measuring keys
From:   Mimi Zohar <zohar@linux.ibm.com>
To:     Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        linux-integrity@vger.kernel.org
Cc:     eric.snowberg@oracle.com, dhowells@redhat.com,
        matthewgarrett@google.com, sashal@kernel.org,
        jamorris@linux.microsoft.com, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org
Date:   Wed, 27 Nov 2019 13:52:21 -0500
In-Reply-To: <20191127015654.3744-6-nramas@linux.microsoft.com>
References: <20191127015654.3744-1-nramas@linux.microsoft.com>
         <20191127015654.3744-6-nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112718-0016-0000-0000-000002CD15C5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112718-0017-0000-0000-0000332EF741
Message-Id: <1574880741.4793.292.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_04:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 malwarescore=0
 adultscore=0 impostorscore=0 suspectscore=3 spamscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270152
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

> --- a/security/integrity/ima/ima_policy.c
> +++ b/security/integrity/ima/ima_policy.c
> @@ -79,6 +79,7 @@ struct ima_rule_entry {
>  		int type;	/* audit type */
>  	} lsm[MAX_LSM_RULES];
>  	char *fsname;
> +	char *keyrings; /* Measure keys added to these keyrings */
>  	struct ima_template_desc *template;
>  };
>  
> @@ -356,6 +357,55 @@ int ima_lsm_policy_change(struct notifier_block *nb, unsigned long event,
>  	return NOTIFY_OK;
>  }
>  
> +/**
> + * ima_match_keyring - determine whether the keyring matches the measure rule
> + * @rule: a pointer to a rule
> + * @keyring: name of the keyring to match against the measure rule
> + *
> + * If the measure action for KEY_CHECK does not specify keyrings=
> + * option then return true (Measure all keys).
> + * Else, return true if the given keyring name is present in
> + * the keyrings= option. False, otherwise.

This is suppose to be a comment, not code or pseudo code.  Please
refer to the section "Comments" in Documentation/process/coding-
style.rst.
 
> + */
> +static bool ima_match_keyring(struct ima_rule_entry *rule,
> +			      const char *keyring)
> +{
> +	const char *p;
> +
> +	/* If "keyrings=" is not specified all keys are measured. */
> +	if (!rule->keyrings)
> +		return true;
> +
> +	if (!keyring)
> +		return false;
> +
> +	/*
> +	 * "keyrings=" is specified in the policy in the format below:
> +	 *   keyrings=.builtin_trusted_keys|.ima|.evm
> +	 *
> +	 * Each keyring name in the option is separated by a '|' and
> +	 * the last keyring name is null terminated.
> +	 *
> +	 * The given keyring is considered matched only if
> +	 * the whole keyring name matched a keyring name specified
> +	 * in the "keyrings=" option.
> +	 */
> +	p = strstr(rule->keyrings, keyring);
> +	if (p) {
> +		/*
> +		 * Found a substring match. Check if the character
> +		 * at the end of the keyring name is | (keyring name
> +		 * separator) or is the terminating null character.
> +		 * If yes, we have a whole string match.
> +		 */
> +		p += strlen(keyring);
> +		if (*p == '|' || *p == '\0')
> +			return true;
> +	}
> +

Using "while strsep()" would simplify this code, removing the need for
such a long comment.

Mimi

> +	return false;
> +}
> +

