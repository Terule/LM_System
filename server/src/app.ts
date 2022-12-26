import express from 'express';

const app = express();

app.use(express.json());

app.get('/', (_req, res) => res.status(200).json('Tudo certo por aqui!'));

export default app;
