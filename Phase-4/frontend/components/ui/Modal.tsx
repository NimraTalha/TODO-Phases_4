import * as React from 'react';
import { cn } from '@/lib/utils';

/**
 * T024-T027: Modal Component
 * Flagship UI modal with backdrop blur, glassmorphism, and entrance animation
 *
 * Integrates with CSS design system from phase3-design-system.css
 */

/**
 * Modal component props
 */
export interface ModalProps {
  isOpen: boolean;
  onClose: () => void;
  title?: string;
  children: React.ReactNode;
  size?: 'sm' | 'md' | 'lg' | 'xl';
  showCloseButton?: boolean;
}

/**
 * Modal component
 *
 * @example
 * ```tsx
 * <Modal isOpen={isOpen} onClose={handleClose} title="Add Todo">
 *   <Modal.Content>
 *     <form>...</form>
 *   </Modal.Content>
 * </Modal>
 * ```
 */
export const Modal = React.forwardRef<HTMLDivElement, ModalProps>(
  (
    {
      isOpen,
      onClose,
      title,
      children,
      size = 'md',
      showCloseButton = true,
    },
    ref
  ) => {
    const [isAnimatingOut, setIsAnimatingOut] = React.useState(false);
    const contentRef = React.useRef<HTMLDivElement>(null);

    // Handle escape key press
    React.useEffect(() => {
      const handleEscape = (e: KeyboardEvent) => {
        if (e.key === 'Escape' && isOpen && !isAnimatingOut) {
          handleClose();
        }
      };

      if (isOpen) {
        window.addEventListener('keydown', handleEscape);
      }

      return () => {
        window.removeEventListener('keydown', handleEscape);
      };
    }, [isOpen, isAnimatingOut]);

    // Prevent body scroll when modal is open
    React.useEffect(() => {
      if (isOpen) {
        document.body.style.overflow = 'hidden';
      }

      return () => {
        document.body.style.overflow = 'unset';
      };
    }, [isOpen]);

    // Handle close with animation
    const handleClose = () => {
      setIsAnimatingOut(true);
      setTimeout(() => {
        setIsAnimatingOut(false);
        onClose();
      }, 200); // Wait for exit animation (200ms)
    };

    // Don't render if not open and not animating out
    if (!isOpen && !isAnimatingOut) return null;

    /**
     * Size classes for modal content
     */
    const sizeClasses: Record<string, string> = {
      sm: 'max-w-sm',
      md: 'max-w-md',
      lg: 'max-w-lg',
      xl: 'max-w-xl',
    };

    // Determine animation classes based on state
    const overlayAnimationClass = isAnimatingOut
      ? 'animate-[fadeOut_200ms_ease-in]'
      : 'animate-[fadeIn_200ms_ease-out]';

    const contentAnimationClass = isAnimatingOut
      ? 'animate-[scaleOut_200ms_ease-in]'
      : 'animate-[modalEnter_200ms_ease-out]';

    return (
      <div
        className="modal-overlay"
        aria-modal="true"
        role="dialog"
        aria-labelledby={title ? 'modal-title' : undefined}
      >
        {/* Modal backdrop with blur */}
        <div
          className={`modal-overlay ${overlayAnimationClass}`}
          onClick={handleClose}
          aria-hidden="true"
        />

        {/* Modal content with glassmorphism */}
        <div
          ref={ref || contentRef}
          className={`modal-content ${sizeClasses[size]} ${contentAnimationClass}`}
          role="document"
        >
          {/* Header */}
          {title && (
            <div className="modal-header">
              <h2
                id="modal-title"
                className="modal-title"
              >
                {title}
              </h2>
              {showCloseButton && (
                <button
                  type="button"
                  onClick={handleClose}
                  className="modal-close"
                  aria-label="Close modal"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    className="h-6 w-6"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    strokeWidth={2}
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      d="M6 18L18 6M6 6l12 12"
                    />
                  </svg>
                </button>
              )}
            </div>
          )}

          {/* Body */}
          <div className="modal-body">{children}</div>

          {/* Footer - added for completeness with design system */}
          <div className="modal-footer hidden"></div>
        </div>

        {/* Add animation keyframes via style for entrance/exit */}
        <style jsx global>{`
          @keyframes fadeIn {
            from {
              opacity: 0;
            }
            to {
              opacity: 1;
            }
          }
          @keyframes fadeOut {
            from {
              opacity: 1;
            }
            to {
              opacity: 0;
            }
          }
          @keyframes scaleIn {
            from {
              opacity: 0;
              transform: scale(0.95);
            }
            to {
              opacity: 1;
              transform: scale(1);
            }
          }
          @keyframes scaleOut {
            from {
              opacity: 1;
              transform: scale(1);
            }
            to {
              opacity: 0;
              transform: scale(0.95);
            }
          }
        `}</style>
      </div>
    );
  }
);

Modal.displayName = 'Modal';
