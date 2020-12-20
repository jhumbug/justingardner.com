import { AppProps } from 'next/app';
import React from 'react';

import '../lib/styles/app.scss';

const App: React.FC<AppProps> = ({ Component, pageProps }) => (
    <main>
        <Component {...pageProps} />
    </main>
);

export default App;
