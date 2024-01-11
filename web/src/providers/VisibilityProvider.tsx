import React, {Context, createContext, useContext, useEffect, useState} from 'react';
import { useNuiEvent } from '../hooks/useNuiEvent';
import { fetchNui } from '../utils/fetchNui';
import { isEnvBrowser } from '../utils/misc';

const visibilityCtx = createContext<VisibilityProviderValue | null>(null)

interface VisibilityProviderValue {
  setVisible: (visible: boolean) => void;
  visible: boolean;
};

export const VisibilityProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [visible, setVisible] = useState(false);

  useNuiEvent<boolean>('setVisible', setVisible);

  useEffect(() => {
    if (!visible) return;

    const keyHandler = (e: KeyboardEvent) => {
      if (['Backspace', 'Escape'].includes(e.code)) {
        if (!isEnvBrowser()) fetchNui('hideFrame');
        else setVisible(!visible);
      };
    };

    window.addEventListener('keydown', keyHandler);

    return () => window.removeEventListener('keydown', keyHandler);
  }, [visible]);

  return (
    <visibilityCtx.Provider value={{ visible, setVisible}}>
      <div style={{ visibility: visible ? 'visible' : 'hidden', height: '100%'}}>{children}</div>
    </visibilityCtx.Provider>
  );
};

export const useVisibility = () => useContext<VisibilityProviderValue>(visibilityCtx as Context<VisibilityProviderValue>);
