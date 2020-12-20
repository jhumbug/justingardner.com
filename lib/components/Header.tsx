import clsx from 'clsx';
import React from 'react';

import { ReactComponent as Check } from '../images/check.svg';

import styles from './header.module.scss';

type Props = React.HTMLAttributes<HTMLElement>;

export const Header: React.FC<Props> = (props) => (
    <div {...props} className={clsx(styles.header, props.className)}>
        <div className={styles.check}>
            <Check />
        </div>
    </div>
);
