// const dev = process.env.NODE_ENV !== 'production';
const basePath = '';

module.exports = {
    assetPrefix: basePath,
    basePath,
    compress: false,
    webpack(config) {
        config.module.rules.push({
            test: /\.svg$/,
            exclude: /node_modules/,
            use: ['@svgr/webpack', 'url-loader'],
        }, {
            test: /\.md$/,
            exclude: /node_modules/,
            use: ['html-loader', 'markdown-loader'],
        });

        return config;
    },
};
