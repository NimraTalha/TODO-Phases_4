'use client';

import * as React from 'react';
import Link from 'next/link';
import { Button } from '@/components/ui/Button';
import { UserMenu, checkAuthentication } from './UserMenu';

export function AuthControls() {
  const [isAuthenticated, setIsAuthenticated] = React.useState(false);

  React.useEffect(() => {
    // Check authentication status on mount
    setIsAuthenticated(checkAuthentication());
    
    // Listen for storage events to update auth status across tabs
    const handleStorageChange = () => {
      setIsAuthenticated(checkAuthentication());
    };
    
    window.addEventListener('storage', handleStorageChange);
    return () => window.removeEventListener('storage', handleStorageChange);
  }, []);

  return (
    <div className="flex items-center gap-2">
      {isAuthenticated ? (
        <UserMenu />
      ) : (
        <div className="flex items-center gap-2">
          <Link href="/auth/sign-in">
            <Button
              variant="secondary"
              size="sm"
              className="rounded-full bg-gradient-to-r from-green-100 to-green-200 text-green-800 hover:from-green-200 hover:to-green-300 transition-all duration-300 ease-out-cubic hover:shadow-md hover:shadow-green-200/50 border-0"
            >
              Sign In
            </Button>
          </Link>
          <Link href="/auth/sign-up">
            <Button
              variant="primary"
              size="sm"
              className="rounded-full bg-gradient-to-r from-green-600 to-green-800 text-white hover:from-green-700 hover:to-green-900 transition-all duration-300 ease-out-cubic hover:shadow-md hover:shadow-green-400/30"
            >
              Sign Up
            </Button>
          </Link>
        </div>
      )}
    </div>
  );
}