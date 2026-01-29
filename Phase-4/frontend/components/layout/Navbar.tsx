'use client';

import * as React from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { UserMenu } from './UserMenu'; // Assuming we have a UserMenu component

export const Navbar = () => {
  const pathname = usePathname();
  const [isLoggedIn, setIsLoggedIn] = React.useState(false);
  const [user, setUser] = React.useState<{ name: string; email: string } | null>(null);

  // Mock login/logout functionality for demonstration
  const handleLogin = () => {
    // In a real app, this would be handled by your auth system
    setIsLoggedIn(true);
    setUser({ name: 'John Doe', email: 'john@example.com' });
  };

  const handleLogout = () => {
    setIsLoggedIn(false);
    setUser(null);
  };

  return (
    <header className="sticky top-0 z-50 w-full border-b border-border/40 bg-background/95 backdrop-blur">
      <div className="container flex h-16 items-center space-x-4 sm:justify-between sm:space-x-0">
        <div className="flex gap-6 md:gap-10">
          <Link href="/" className="flex items-center space-x-2">
            <span className="text-2xl font-bold bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 bg-clip-text text-transparent">
              TodoApp
            </span>
          </Link>
          <nav className="hidden md:flex gap-6">
            <Link
              href="/"
              className={`transition-colors hover:text-foreground/80 text-foreground ${
                pathname === '/' ? 'font-bold' : ''
              }`}
            >
              Home
            </Link>
            <Link
              href="/dashboard"
              className={`transition-colors hover:text-foreground/80 text-foreground ${
                pathname === '/dashboard' ? 'font-bold' : ''
              }`}
            >
              Dashboard
            </Link>
          </nav>
        </div>
        
        <div className="flex items-center gap-4">
          {isLoggedIn ? (
            <div className="flex items-center gap-4">
              <span className="hidden md:inline-flex">Welcome, {user?.name}</span>
              <UserMenu onSignOut={handleLogout} user={user} />
            </div>
          ) : (
            <div className="flex items-center gap-2">
              <Link
                href="/auth/sign-in"
                className="px-4 py-2 text-sm font-medium rounded-lg transition-colors hover:bg-secondary"
              >
                Sign In
              </Link>
              <Link
                href="/auth/sign-up"
                className="px-4 py-2 text-sm font-medium bg-primary text-primary-foreground rounded-lg transition-colors hover:opacity-90"
              >
                Sign Up
              </Link>
            </div>
          )}
        </div>
      </div>
    </header>
  );
};