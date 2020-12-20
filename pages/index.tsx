import { NextPage } from 'next';
import Head from 'next/head';
import React, { useState } from 'react';

import { Header } from '../lib/components/Header';
import styles from '../lib/styles/index.module.scss';

const desc = '';
const url = 'https://www.justingardner.com';

const Index: NextPage = () => {
    return (
        <div className={styles.root}>
            <Head>
                <title>Justin Gardner</title>
                <meta name="description" content={desc} />
                <meta property="og:description" content={desc} />
                <meta property="og:title" content="Justin Gardner" />
                <meta property="og:image" content="" />
                <meta property="og:url" content={url} />
                <link rel="canonical" href={url} />
            </Head>

            <Header></Header>
        </div>
    );
};

export default Index;
