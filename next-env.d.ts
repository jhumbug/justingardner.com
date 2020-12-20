/// <reference types="next" />
/// <reference types="next/types/global" />

declare module '*.svg' {
    const svg: string;
    export const ReactComponent: React.FC<React.SVGProps<SVGSVGElement>>;
    export default svg;
}

declare module '*.md' {
    const md: string;
    export default md;
}
