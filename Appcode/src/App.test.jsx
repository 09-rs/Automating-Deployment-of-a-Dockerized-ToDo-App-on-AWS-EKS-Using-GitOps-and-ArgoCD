
import { render, screen } from '@testing-library/react';
import App from './App.jsx';

describe('ToDo application', () => {
  test('renders the ToDo application', () => {
    render(<App />);

    expect(
      screen.getByText(/TODO LIST/i)
    ).toBeInTheDocument();
  });
});
