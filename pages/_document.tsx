import Document, { Head, Html, Main, NextScript } from 'next/document';
import React from 'react';

export default class extends Document {
    render() {
        return (
            <Html lang="en">
                <Head></Head>
                <body>
                    <div id="__root">
                        <Main />
                    </div>
                    <NextScript />
                </body>
            </Html>
        );
    }
}
